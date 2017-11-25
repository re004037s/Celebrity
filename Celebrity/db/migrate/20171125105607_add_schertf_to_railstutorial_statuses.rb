class AddSchertfToRailstutorialStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :railstutorial_statuses, :schertf, :date
  end
end
