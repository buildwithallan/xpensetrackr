class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :expense_name
      t.string :category
      t.decimal :amount

      t.timestamps
    end
  end
end
