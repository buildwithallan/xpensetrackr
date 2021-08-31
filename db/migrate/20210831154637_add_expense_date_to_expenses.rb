class AddExpenseDateToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :expense_date, :date
  end
end
