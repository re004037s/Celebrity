class Tag < ApplicationRecord
    has_many :user_tag                  #user_tags(中間テーブル)を多く持っている
    has_many :user, through: :user_tag #user_tags(中間テーブル)を通じて、userを多く持っている。throughを定義する場合、それに関連するもの通過するものは先に関連付けさせる。
    accepts_nested_attributes_for :user_tag
    validates :tag, presence: true #タグが空の場合バリデート
    validates :user_id, presence: true #user_idが存在しているかのバリデート
end
