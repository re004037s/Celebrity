class AddSchejToJavascriptStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :javascript_statuses, :schej, :date
  end
end
