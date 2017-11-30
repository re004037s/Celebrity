class AddScheduleDateToJavascriptStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :javascript_statuses, :schedule_date, :date
  end
end
