class AddCompdateToJavascriptStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :javascript_statuses, :ga_beginner_compd, :date
    add_column :javascript_statuses, :do_beginner_compd, :date
  end
end
