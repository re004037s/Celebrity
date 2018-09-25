class RemoveUserFromTerms < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :terms, :users
    remove_reference :terms, :user, index: true
  end
end
