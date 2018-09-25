class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 3000 }
  validates :thumbnail, presence: true
  validate  :picture_size
  mount_uploader :thumbnail, ThumbnailUploader
  
  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if thumbnail.size > 5.megabytes
        errors.add(:thumbnail, "5MB未満の画像ファイルを選択してください")
      end
    end
end
