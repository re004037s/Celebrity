class AddPictureFileToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :picture_file, :binary
  end
end
