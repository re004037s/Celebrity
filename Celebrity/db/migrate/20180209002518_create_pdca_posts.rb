class CreatePdcaPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :pdca_posts do |t|
      t.text :plan
      t.text :do
      t.text :check
      t.text :action
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
