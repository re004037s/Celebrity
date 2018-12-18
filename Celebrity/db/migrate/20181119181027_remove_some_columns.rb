class RemoveSomeColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :html_css_statuses, :ji_1, :boolean
    remove_column :html_css_statuses, :ji_2, :boolean
    remove_column :html_css_statuses, :ji_1_compd, :date
    remove_column :html_css_statuses, :ji_2_compd, :date
    remove_column :html_css_statuses, :ji_1_completion, :date
    remove_column :html_css_statuses, :ji_2_completion, :date
    remove_column :javascript_statuses, :do_1, :boolean
    remove_column :javascript_statuses, :do_1_compd, :date
    remove_column :javascript_statuses, :do_1_completion, :date
  end
end
