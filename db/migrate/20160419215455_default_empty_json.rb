class DefaultEmptyJson < ActiveRecord::Migration
  def change
    change_column :users, :tokens, :json, default: {}
  end
end
