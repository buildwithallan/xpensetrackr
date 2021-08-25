class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.decimal :monthly_income

      t.timestamps
    end
  end
end
