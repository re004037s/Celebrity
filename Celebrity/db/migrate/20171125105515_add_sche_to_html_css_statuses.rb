class AddScheToHtmlCssStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :html_css_statuses, :sche, :date
  end
end
