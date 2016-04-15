class CreateCompanyInfos < ActiveRecord::Migration
  def change
    create_table :company_infos do |t|
      t.string :website
      t.string :blog
      t.string :address

      t.timestamps null: false
    end
  end
end
