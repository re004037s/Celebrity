class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
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
    
# アカウントを有効にする
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # パスワード再設定の属性を設定する
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # パスワード再設定のメールを送信する
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  # パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
    end
    
      # ランダムなトークンを返す
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    

    
end