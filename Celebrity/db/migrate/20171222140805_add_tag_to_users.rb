class AddTagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tag, :string
  end
end
