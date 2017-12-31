class RemovePictureFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :picture, :string
  end
end
