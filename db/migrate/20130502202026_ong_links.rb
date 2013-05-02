class OngLinks < ActiveRecord::Migration
  def up
	add_column :charities, :link_url, :string
  end

  def down
  	remove_column :charities, :link_url
  end
end
