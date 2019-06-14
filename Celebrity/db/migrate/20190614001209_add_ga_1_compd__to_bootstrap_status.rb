class AddGa1CompdToBootstrapStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :bootstrap_statuses, :ga_1_compd, :date
    add_column :bootstrap_statuses, :ga_2_compd, :date
    add_column :bootstrap_statuses, :ga_1_completion, :date
    add_column :bootstrap_statuses, :ga_2_completion, :date
  end
end
