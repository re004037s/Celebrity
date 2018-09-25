class AddUserRefToTerms < ActiveRecord::Migration[5.0]
  def change
    add_reference :terms, :user, foreign_key: true
  end
end
