class AddTypeToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :kind, :string
  end
end
