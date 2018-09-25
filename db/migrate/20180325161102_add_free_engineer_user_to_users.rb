class AddFreeEngineerUserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :free_engineer_user, :boolean, default: true, null: false
  end
end
