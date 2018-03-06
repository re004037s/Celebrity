class AddCreateUserIdFromTerms < ActiveRecord::Migration[5.0]
  def change
    add_column :terms, :create_user_id, :integer, :null => false, :default => 0
    add_index :terms, :create_user_id
  end
end
