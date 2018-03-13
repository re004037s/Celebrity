class AddGestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gest, :boolean, default: false
  end
end
