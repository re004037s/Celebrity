class RenameScheroColumnToRubyonrailsStatuses < ActiveRecord::Migration[5.0]
  def change
    rename_column :rubyonrails_statuses, :schero, :schedule_date
  end
end
