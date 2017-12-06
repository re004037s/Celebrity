class AddScheduleDateToRubyStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :ruby_statuses, :schedule_date, :date
  end
end
