class AddPortfolioPathToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :portfolio_path, :string
  end
end
