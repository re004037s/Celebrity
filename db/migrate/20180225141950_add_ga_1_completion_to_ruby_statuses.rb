class AddGa1CompletionToRubyStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :ruby_statuses, :ga_1_completion, :date
    add_column :ruby_statuses, :ga_2_completion, :date
    add_column :ruby_statuses, :ga_3_completion, :date
    add_column :ruby_statuses, :ga_4_completion, :date
    add_column :ruby_statuses, :ga_5_completion, :date
  end
end
