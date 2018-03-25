class RemoveFreeengineeruserToUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :free_engineer_user
  end
  
  def down
    add_column :users, :free_engineer_user, :boolean, default: true, null: false
  end
end
