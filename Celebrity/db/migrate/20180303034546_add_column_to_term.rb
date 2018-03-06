class AddColumnToTerm < ActiveRecord::Migration[5.0]
  def change
    add_column :terms, :create_user, :integer
    add_reference :terms, :user, foreign_key: true
  end
end
