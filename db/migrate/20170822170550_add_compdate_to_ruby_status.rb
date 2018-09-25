class AddCompdateToRubyStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :ruby_statuses, :ga_1_compd, :date
    add_column :ruby_statuses, :ga_2_compd, :date
    add_column :ruby_statuses, :ga_3_compd, :date
    add_column :ruby_statuses, :ga_4_compd, :date
    add_column :ruby_statuses, :ga_5_compd, :date
  end
end
