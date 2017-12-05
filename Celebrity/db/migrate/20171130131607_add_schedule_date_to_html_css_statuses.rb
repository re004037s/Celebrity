class AddScheduleDateToHtmlCssStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :html_css_statuses, :schedule_date, :date
  end
end
