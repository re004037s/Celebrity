class AddScherToRubyStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :ruby_statuses, :scher, :date
  end
end
