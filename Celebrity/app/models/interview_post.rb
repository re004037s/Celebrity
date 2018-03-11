class InterviewPost < ApplicationRecord
  belongs_to :user
  self.inheritance_column = :_type_disabled # "type"カラムを使用するために追記必要
  default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 30 }
    validates :language, presence: true
    validates :experience, presence: true
    validates :type, presence: true
    validates :day, presence: true
    # validates :summary, presence: true
    validates :question, presence: true
    # validates :result, presence: true
end
