class AddColumnToPdcaPost < ActiveRecord::Migration[5.0]
  def change
    add_column :pdca_posts, :date, :date
  end
end
