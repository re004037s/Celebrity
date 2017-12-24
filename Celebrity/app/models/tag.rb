class Tag < ApplicationRecord
    has_many :users, through: :user_tags
    has_many :user_tags
    accepts_nested_attributes_for :user_tags
end
