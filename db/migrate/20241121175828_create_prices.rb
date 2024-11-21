class CreatePrices < ActiveRecord::Migration[8.0]
  def change
    create_table :prices do |t|
      t.references :item, null: false, foreign_key: true
      t.references :market, null: false, foreign_key: true
      t.decimal :price
      t.date :date_recorded

      t.timestamps
    end
  end
end
