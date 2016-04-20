class Deletescorefromusers < ActiveRecord::Migration
  def change
    remove_column :users, :score
    add_column :activities, :scoreable_type, :string
    add_column :activities, :scoreable_id, :integer
  end
end
