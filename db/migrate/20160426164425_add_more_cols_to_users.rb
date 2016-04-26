class AddMoreColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :default_location, :string
    add_column :users, :default_keyword, :string
  end
end
