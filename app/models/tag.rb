class Tag < ApplicationRecord
    has_many :user_tags,  foreign_key: 'tag_id'   #user_tags(中間テーブル)を多く持っている has_manyに指定する場合複数形　foreign_key: "紐付け先TBLの結合用カラム
    has_many :users, through: :user_tags #:throughでuser_tags(中間テーブル)を通じて、userを多く持っている。throughを定義する場合、それに関連するもの通過するものは先に関連付けさせる。
    accepts_nested_attributes_for :user_tags #他のモデルを一括で更新、保存できるようにするもの。user_tagも更新・保存
    validates :tag, presence: true
    # validates :user_id, presence: true #user_idが存在しているかのバリデート
end