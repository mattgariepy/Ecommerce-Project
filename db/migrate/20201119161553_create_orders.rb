class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :orderDate
      t.decimal :subTotal
      t.decimal :total
      t.decimal :gstAmount
      t.decimal :pstAmount
      t.decimal :hstAmount
      t.string :status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
