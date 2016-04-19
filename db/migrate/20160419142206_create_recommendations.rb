class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.datetime :start_date, null: false
      t.string :recommendable_type, null: false
      t.integer :recommendable_id, null: false
      t.string :action, null: false
      t.boolean :completed, null: false

      t.timestamps null: false
    end
  end
end
