class PriceDescription < ActiveRecord::Migration
  def change

  	add_column :races, :price_description, :text

  end
end
