class CreateQuestionCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :question_categories do |t|
      t.string :name
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
