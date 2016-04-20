class CompanyIdRequired < ActiveRecord::Migration
  def change
    change_column :leads, :company_id, :integer, null: false
  end
end
