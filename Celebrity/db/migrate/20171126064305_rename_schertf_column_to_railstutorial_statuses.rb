class RenameSchertfColumnToRailstutorialStatuses < ActiveRecord::Migration[5.0]
  def change
    rename_column :railstutorial_statuses, :schertf, :schedule_date_impression
  end
end
