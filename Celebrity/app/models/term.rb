class Term < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 500 }
  belongs_to :user
  belongs_to :create_user, :class_name => "User"

  def self.search(search)
    all
  end

  def self.partiallysearch(key)
    if key == nil
      return nil
    else
      where(['content ILIKE ?', "%#{key}%"])
    end
  end
end
