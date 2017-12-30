class CreateUserTags < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tags do |t|
      t.references :tag, foreign_key: true
      t.references :user, foreign_key: true #refernces型は外部キーを追加する時に使います  user id?

      t.timestamps
    end
  end
end
