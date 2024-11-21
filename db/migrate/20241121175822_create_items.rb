class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :measurement
      t.string :image_url
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :items, :slug
  end
end
