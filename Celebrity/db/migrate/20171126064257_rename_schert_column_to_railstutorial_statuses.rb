class RenameSchertColumnToRailstutorialStatuses < ActiveRecord::Migration[5.0]
  def change
    rename_column :railstutorial_statuses, :schert, :schedule_date
  end
end
