class AddThumbnailToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :thumbnail, :binary
  end
end
