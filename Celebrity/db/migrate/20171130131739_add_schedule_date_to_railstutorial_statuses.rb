class AddScheduleDateToRailstutorialStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :railstutorial_statuses, :schedule_date, :date
  end
end
