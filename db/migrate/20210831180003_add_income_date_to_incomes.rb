class AddIncomeDateToIncomes < ActiveRecord::Migration[6.1]
  def change
    add_column :incomes, :income_date, :date
  end
end
