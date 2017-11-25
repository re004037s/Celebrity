class AddScheroToRubyonrailsStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :rubyonrails_statuses, :schero, :date
  end
end
