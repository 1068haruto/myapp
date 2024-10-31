class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.integer :amount
      t.date :sold_on

      t.timestamps
    end
  end
end
