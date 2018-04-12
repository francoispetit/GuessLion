class AddCompetencesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :dev, :string
    add_column :users, :growth, :string
    add_column :users, :sales, :string
    add_column :users, :product, :string
    add_column :users, :ops, :string
  end
end
