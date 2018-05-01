class AddThumbnailnameToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :thumbnail_name, :string
  end
end
