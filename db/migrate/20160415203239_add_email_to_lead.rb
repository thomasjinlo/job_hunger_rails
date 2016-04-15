class AddEmailToLead < ActiveRecord::Migration
  def change
    add_column :leads, :email, :string
  end
end
