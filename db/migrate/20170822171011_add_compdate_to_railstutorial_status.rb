class AddCompdateToRailstutorialStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :railstutorial_statuses, :chapter1_compd, :date
    add_column :railstutorial_statuses, :chapter2_compd, :date
    add_column :railstutorial_statuses, :chapter3_compd, :date
    add_column :railstutorial_statuses, :chapter4_compd, :date
    add_column :railstutorial_statuses, :chapter5_compd, :date
    add_column :railstutorial_statuses, :chapter6_compd, :date
    add_column :railstutorial_statuses, :chapter7_compd, :date
    add_column :railstutorial_statuses, :chapter8_compd, :date
    add_column :railstutorial_statuses, :chapter9_compd, :date
    add_column :railstutorial_statuses, :chapter10_compd, :date
    add_column :railstutorial_statuses, :chapter11_compd, :date
    add_column :railstutorial_statuses, :chapter12_compd, :date
    add_column :railstutorial_statuses, :chapter13_compd, :date
    add_column :railstutorial_statuses, :chapter14_compd, :date
  end
end
