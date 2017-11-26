class User < ApplicationRecord
    before_save { self.email = email.downcase }
    default_scope -> { order(:created_at) }
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
    
    has_many :feedbacks
    
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
end
