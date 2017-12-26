class UserTag < ApplicationRecord
  belongs_to :tag #tagと1対1の関係
  belongs_to :user #userと1対1の関係
end
