class Races < ActiveRecord::Migration
  def change

  	create_table :races do |t|
  		t.date :race_date
  		t.string :title
  		t.string :title2
  		t.text :description
  		t.text :how_it_workd
  		t.text :rules
  		t.text :map_embed_url
  		t.integer :status
  		t.text :eventioz_link


  	end

  end
end
