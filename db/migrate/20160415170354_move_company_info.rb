class MoveCompanyInfo < ActiveRecord::Migration
  def change
    drop_table :company_infos

    add_column :companies, :website, :string
    add_column :companies, :blog, :string
    add_column :companies, :address, :string
  end
end
