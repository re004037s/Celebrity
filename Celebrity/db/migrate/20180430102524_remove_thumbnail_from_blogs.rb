class RemoveThumbnailFromBlogs < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :thumbnail, :string
  end
end
