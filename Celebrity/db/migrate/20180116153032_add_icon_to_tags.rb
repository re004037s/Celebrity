class AddIconToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :icon, :binary
  end
end
