class CompanyInfoCleanup < ActiveRecord::Migration
  def change
    add_column :company_infos, :company_id, :integer

    drop_table :resources
  end
end
