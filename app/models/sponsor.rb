class Sponsor < ActiveRecord::Base
	belongs_to :race
	validates_presence_of :race_id, :xtype

	has_attached_file :img, styles: {
	    thumb: '200x150>'
	 }
	attr_accessible :img, :xtype, :race_id
	inheritance_column = :nada
end