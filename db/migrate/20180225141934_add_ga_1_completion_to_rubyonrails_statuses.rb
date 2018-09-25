class AddGa1CompletionToRubyonrailsStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :rubyonrails_statuses, :ga_1_completion, :date
    add_column :rubyonrails_statuses, :ga_2_completion, :date
    add_column :rubyonrails_statuses, :ga_3_completion, :date
    add_column :rubyonrails_statuses, :ga_4_completion, :date
    add_column :rubyonrails_statuses, :ga_5_completion, :date
    add_column :rubyonrails_statuses, :ga_6_completion, :date
    add_column :rubyonrails_statuses, :ga_7_completion, :date
    add_column :rubyonrails_statuses, :ga_8_completion, :date
    add_column :rubyonrails_statuses, :ga_9_completion, :date
    add_column :rubyonrails_statuses, :ga_10_completion, :date
    add_column :rubyonrails_statuses, :ga_11_completion, :date
    add_column :rubyonrails_statuses, :do_1_completion, :date
    add_column :rubyonrails_statuses, :do_2_completion, :date
    add_column :rubyonrails_statuses, :do_3_completion, :date
    add_column :rubyonrails_statuses, :do_4_completion, :date
  end
end
