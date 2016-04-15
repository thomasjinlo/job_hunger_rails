class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.text :notes
      t.integer :interest

      t.timestamps null: false
    end
  end
end
