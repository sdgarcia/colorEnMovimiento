class SponsorsCustomType < ActiveRecord::Migration
  def up

  	add_column :races, :sponsor_type_1, :string
  	add_column :races, :sponsor_type_2, :string
  	add_column :races, :sponsor_type_3, :string

  	add_column :sponsors, :link_url, :string
  end

  def down

  	remove_column :races, :sponsor_type_1
  	remove_column :races, :sponsor_type_2
  	remove_column :races, :sponsor_type_3
  	
  	remove_column :sponsors, :link_url
  end
end
