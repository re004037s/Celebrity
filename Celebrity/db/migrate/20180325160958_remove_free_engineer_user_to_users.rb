class RemoveFreeEngineerUserToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :free_engineer_user, :boolean
  end
end
