class AddDefaultInterestToCompanies < ActiveRecord::Migration
  def up
    change_column_default :companies, :interest, 0
    Company.all.each do |company|
      company.update interest: 0
    end
  end

  def down
    change_column_default :companies, :interest, nil
  end
end
