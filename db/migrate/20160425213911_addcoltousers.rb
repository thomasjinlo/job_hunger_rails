class Addcoltousers < ActiveRecord::Migration
  def change
    add_column :users, :has_onboarded, :boolean
  end
end
