class AddScheduleDateImpressionToRailstutorialStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :railstutorial_statuses, :schedule_date_impression, :date
  end
end
