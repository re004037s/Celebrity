class Tag < ApplicationRecord
    has_many :user_tags,  foreign_key: 'tag_id'   #user_tags(中間テーブル)を多く持っている has_manyに指定する場合複数形　foreign_key: "紐付け先TBLの結合用カラム
    has_many :users, through: :user_tags #:throughでuser_tags(中間テーブル)を通じて、userを多く持っている。throughを定義する場合、それに関連するもの通過するものは先に関連付けさせる。
    accepts_nested_attributes_for :user_tags #他のモデルを一括で更新、保存できるようにするもの。user_tagも更新・保存
    validates :tag, presence: true, length: { maximum: 20, message: "20文字以内で入力してください"}, format: { with: /\A[a-zA-Z\s]+\z/, #半角スペースの正規表現は\sを挿入する
    message: "英文字のみが使用できます" }
    # validates :user_id, presence: true #user_idが存在しているかのバリデート
end
