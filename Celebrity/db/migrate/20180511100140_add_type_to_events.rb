class AddTypeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :free, :boolean
    add_column :events, :venture, :boolean
  end
end
