class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :categories, :slug
  end
end
