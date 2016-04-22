class Addglassdoortocompany < ActiveRecord::Migration
  def change
    add_column :companies, :glassdoor_rating, :decimal
    add_column :companies, :glassdoor_website, :string
    add_column :companies, :glassdoor_logo_link, :string
  end
end
