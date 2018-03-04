class RemoveCreateUserFromTerms < ActiveRecord::Migration[5.0]
  def change
    remove_column :terms, :create_user, :integer
  end
end
