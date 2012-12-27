class CityEnabled < ActiveRecord::Migration
  def change
  	add_column :cities, :enabled, :boolean, :default => true

  end
end
