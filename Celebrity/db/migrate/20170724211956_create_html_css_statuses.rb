class CreateHtmlCssStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :html_css_statuses do |t|
      t.belongs_to :user
      t.boolean :ga_beginner
      t.boolean :ga_middle
      t.boolean :ga_advanced
      t.boolean :do_beginner
      t.boolean :do_middle
      t.boolean :do_advanced
      t.boolean :ji_1
      t.boolean :ji_2

      t.timestamps
    end
  end
end
