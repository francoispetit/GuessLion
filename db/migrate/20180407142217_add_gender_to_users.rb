class AddGenderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :isfemale, :boolean
  end
end
