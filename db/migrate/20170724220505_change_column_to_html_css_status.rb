class ChangeColumnToHtmlCssStatus < ActiveRecord::Migration[5.0]
  def up
    change_column :html_css_statuses, :ga_beginner, :boolean, default: false
    change_column :html_css_statuses, :ga_middle, :boolean, default: false
    change_column :html_css_statuses, :ga_advanced, :boolean, default: false
    change_column :html_css_statuses, :do_beginner, :boolean, default: false
    change_column :html_css_statuses, :do_middle, :boolean, default: false
    change_column :html_css_statuses, :do_advanced, :boolean, default: false
    change_column :html_css_statuses, :ji_1, :boolean, default: false
    change_column :html_css_statuses, :ji_2, :boolean, default: false
    
  end
end
