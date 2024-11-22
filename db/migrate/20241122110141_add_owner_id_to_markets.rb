class AddOwnerIdToMarkets < ActiveRecord::Migration[8.0]
  def change
    add_reference :markets, :owner, foreign_key: { to_table: :users }
  end
end
