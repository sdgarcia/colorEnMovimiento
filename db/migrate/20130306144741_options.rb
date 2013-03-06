#encoding: utf-8
class Options < ActiveRecord::Migration
  def change
  	create_table :options do |t|
  		t.string :key
  		t.text :value
  	end
  	Option.create(:key => "texto_home", :value => "Inscribite ya en la nueva carrera de Vicente López en Abril!")
  end
end
