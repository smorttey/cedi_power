class CreateMarkets < ActiveRecord::Migration[8.0]
  def change
    create_table :markets do |t|
      t.string :name
      t.string :slug
      t.string :location
      t.string :type

      t.timestamps
    end
    add_index :markets, :slug
  end
end
