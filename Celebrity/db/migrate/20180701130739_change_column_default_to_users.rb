class ChangeColumnDefaultToUsers < ActiveRecord::Migration[5.0]
  def up
    change_column_default :users, :staff_user, false
  end
  
  def down
    change_column_default :users, :staff_user, true
  end
end
