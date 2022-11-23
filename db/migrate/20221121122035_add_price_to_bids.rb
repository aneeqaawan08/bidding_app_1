class AddPriceToBids < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :price, :integer
  end
end
