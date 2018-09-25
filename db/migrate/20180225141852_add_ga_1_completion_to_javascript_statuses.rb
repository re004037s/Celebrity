class AddGa1CompletionToJavascriptStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :javascript_statuses, :ga_1_completion, :date
    add_column :javascript_statuses, :ga_2_completion, :date
    add_column :javascript_statuses, :ga_3_completion, :date
    add_column :javascript_statuses, :ga_4_completion, :date
    add_column :javascript_statuses, :do_1_completion, :date
  end
end
