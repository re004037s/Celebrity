class UserTag < ApplicationRecord
  belongs_to :user #userと1対1の関係
  belongs_to :tag #tagと1対1の関係
  accepts_nested_attributes_for :tag #addresses_attributes=が自動的に追加され、それにより、(tag)の追加、更新、削除ができるようになります。
end
