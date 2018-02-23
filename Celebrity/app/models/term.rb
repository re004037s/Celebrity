class Term < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true

  def self.search(search)
    all
  end

  def self.partiallysearch(key)
    if key == nil
      return nil
    else
      where(['content LIKE ?', "%#{key}%"])
    end
  end
end
