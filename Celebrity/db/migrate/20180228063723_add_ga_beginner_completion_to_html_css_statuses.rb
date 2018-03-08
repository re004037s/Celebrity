class AddGaBeginnerCompletionToHtmlCssStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :html_css_statuses, :ga_beginner_completion, :date
    add_column :html_css_statuses, :ga_middle_completion, :date
    add_column :html_css_statuses, :ga_advanced_completion, :date
    add_column :html_css_statuses, :do_beginner_completion, :date
    add_column :html_css_statuses, :do_middle_completion, :date
    add_column :html_css_statuses, :do_advanced_completion, :date
    add_column :html_css_statuses, :ji_1_completion, :date
    add_column :html_css_statuses, :ji_2_completion, :date
  end
end
