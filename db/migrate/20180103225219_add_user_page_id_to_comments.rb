class AddUserPageIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_page_id, :integer
  end
end
