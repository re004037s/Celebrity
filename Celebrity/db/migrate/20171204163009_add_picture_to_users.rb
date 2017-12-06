class AddPictureToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_pic_name, :string
    add_column :users, :profile_pic, :binary
  end
end
