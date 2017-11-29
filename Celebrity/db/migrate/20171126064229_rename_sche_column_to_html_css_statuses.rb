class RenameScheColumnToHtmlCssStatuses < ActiveRecord::Migration[5.0]
  def change
    rename_column :html_css_statuses, :sche, :schedule_date
  end
end
