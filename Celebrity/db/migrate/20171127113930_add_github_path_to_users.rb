class AddGithubPathToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :github_path, :string
  end
end
