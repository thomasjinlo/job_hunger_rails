class AddLinkToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :link, :string
  end
end
