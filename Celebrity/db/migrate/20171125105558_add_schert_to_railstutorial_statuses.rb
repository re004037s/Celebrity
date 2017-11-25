class AddSchertToRailstutorialStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :railstutorial_statuses, :schert, :date
  end
end
