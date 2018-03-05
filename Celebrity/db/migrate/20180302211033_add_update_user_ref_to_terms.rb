class AddUpdateUserRefToTerms < ActiveRecord::Migration[5.0]
  def change
    add_column :terms, :update_user_id, :integer, :null => false, :default => 0
    add_index :terms, :update_user_id
  end
end
