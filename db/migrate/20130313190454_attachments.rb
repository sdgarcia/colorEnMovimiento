class Attachments < ActiveRecord::Migration
  def change

  	add_column :races, :docs_file_name, :string
	add_column :races, :docs_content_type, :string
  	add_column :races, :docs_file_size, :integer
  	add_column :races, :docs_updated_at, :datetime

  	add_column :races, :header_file_name, :string
	add_column :races, :header_content_type, :string
  	add_column :races, :header_file_size, :integer
  	add_column :races, :header_updated_at, :datetime

  	create_table :sponsors do |t|
  		t.integer :race_id
  		t.integer :order
  		t.string :img_file_name
  		t.string :img_content_type
  		t.integer :img_file_size
  		t.datetime :img_updated_at
  		t.integer :xtype
  	end

  	create_table :charities do |t|
  		t.integer :race_id
  		t.integer :order
  		t.string :img_file_name
  		t.string :img_content_type
  		t.integer :img_file_size
  		t.datetime :img_updated_at
  	end
  	 
  end
end
