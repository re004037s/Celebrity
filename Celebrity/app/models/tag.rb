class Tag < ApplicationRecord
    has_many :users, through: :user_tags #user_tags(中間テーブル)を通じて、userを多く持っている
    has_many :user_tags                  #user_tags(中間テーブル)を多く持っている
    accepts_nested_attributes_for :user_tags
    validates :tag, presence: true #タグが空の場合バリデート
    validates :user_id, presence: true #user_idが存在しているかのバリデート
end
