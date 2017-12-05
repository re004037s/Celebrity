class AddScheduleDateToRubyonrailsStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :rubyonrails_statuses, :schedule_date, :date
  end
end
