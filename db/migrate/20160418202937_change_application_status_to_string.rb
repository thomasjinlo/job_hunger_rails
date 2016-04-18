class ChangeApplicationStatusToString < ActiveRecord::Migration
  def change
    change_column :jobs, :application_status, :string
  end
end
