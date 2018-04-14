class AddStatusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :string, default: '未登録'
  end
end
