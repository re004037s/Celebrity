class User < ApplicationRecord
    # acts_as_taggable
    before_save { self.email = email.downcase }
    default_scope -> { order(:created_at) }
    mount_uploader :picture, PictureUploader #画像アップロード用に追加
    validates :name, presence: true, length: { maximum: 50 }
    validates :nickname, presence: true, length: { maximum: 50 }
  
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
               format: { with: VALID_EMAIL_REGEX },
               uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    has_one :html_css_status
    has_one :javascript_status
    has_one :ruby_status
    has_one :rubyonrails_status
    has_one :railstutorial_status
    has_one :user_movie_status
    has_many :feedbacks
    has_many :user_tag, dependent: :destroy #user_tagを多く持っている,コメントを削除する動作
    has_many :tag, through: :user_tag #user_tags(中間テーブル)を通じて、tagを多く持っている.throughを定義する場合、それに関連するもの通過するものは先に関連付けさせる。
    
    
    # 渡された文字列のハッシュ値を返す
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    def fb_comp?(movie_id)
        !!self.feedbacks.find_by(movie_id: movie_id)
    end
    
    def before_fb_comp?(sort_order, category_id)
        return true if sort_order == 1
        !!self.feedbacks.find_by(movie_id: Movie.where(movie_category_id: category_id, sort_order: sort_order - 1).first.id)
    end
    
    
    def save_users(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name:new_name)
      self.tags << post_tag
    end
    end
    
end