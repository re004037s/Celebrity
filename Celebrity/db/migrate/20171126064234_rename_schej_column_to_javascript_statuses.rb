class RenameSchejColumnToJavascriptStatuses < ActiveRecord::Migration[5.0]
  def change
    rename_column :javascript_statuses, :schej, :schedule_date
  end
end
