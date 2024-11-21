class RenameTypeToMarketTypeInMarkets < ActiveRecord::Migration[8.0]
  def change
    rename_column :markets, :type, :market_type
  end
end
