class AddCompdateToHtmlCssStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :html_css_statuses, :ga_beginner_compd, :date
    add_column :html_css_statuses, :ga_middle_compd, :date
    add_column :html_css_statuses, :ga_advanced_compd, :date
    add_column :html_css_statuses, :do_beginner_compd, :date
    add_column :html_css_statuses, :do_middle_compd, :date
    add_column :html_css_statuses, :do_advanced_compd, :date
    add_column :html_css_statuses, :ji_1_compd, :date
    add_column :html_css_statuses, :ji_2_compd, :date
  end
end
