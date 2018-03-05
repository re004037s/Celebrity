class RemoveColumnToTerms < ActiveRecord::Migration[5.0]
  def change
    #remove_foreign_key :terms, :users
    remove_reference :terms, :update_user, index: true
    #remove_column :terms, :update_user, :integer
    #remove_index :terms, :update_user
  end
end
