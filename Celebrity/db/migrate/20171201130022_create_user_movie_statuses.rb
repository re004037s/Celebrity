class CreateUserMovieStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_movie_statuses do |t|
      t.belongs_to :user
      t.date :schedule_date
      t.timestamps
    end
  end
end
