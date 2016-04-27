class AddLabelToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :label, :string, default: 'edit'
  end
end
