class ChangeColumnToJavascriptStatus < ActiveRecord::Migration[5.0]
  def change
    remove_column :javascript_statuses, :ga_beginner, :boolean
    remove_column :javascript_statuses, :do_beginner, :boolean
    remove_column :javascript_statuses, :ga_beginner_compd, :date
    remove_column :javascript_statuses, :do_beginner_compd, :date
    
    add_column :javascript_statuses, :ga_1, :boolean, default: false
    add_column :javascript_statuses, :ga_2, :boolean, default: false
    add_column :javascript_statuses, :ga_3, :boolean, default: false
    add_column :javascript_statuses, :ga_4, :boolean, default: false
    add_column :javascript_statuses, :do_1, :boolean, default: false
    
    add_column :javascript_statuses, :ga_1_compd, :date
    add_column :javascript_statuses, :ga_2_compd, :date
    add_column :javascript_statuses, :ga_3_compd, :date
    add_column :javascript_statuses, :ga_4_compd, :date
    add_column :javascript_statuses, :do_1_compd, :date
  end
end
