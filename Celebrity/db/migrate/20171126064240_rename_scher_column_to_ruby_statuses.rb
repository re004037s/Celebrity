class RenameScherColumnToRubyStatuses < ActiveRecord::Migration[5.0]
  def change
    rename_column :ruby_statuses, :scher, :schedule_date
  end
end
