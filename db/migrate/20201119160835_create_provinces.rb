class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.decimal :pstRate
      t.decimal :gstRate
      t.decimal :hstRate

      t.timestamps
    end
  end
end
