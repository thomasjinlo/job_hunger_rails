class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.references :company, index: true, foreign_key: true
      t.string :name, null: false
      t.string :linked_in
      t.string :blog
      t.text :notes
      t.timestamps null: false
    end
  end
end
