class Term < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  
  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
