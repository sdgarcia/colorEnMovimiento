class Charity < ActiveRecord::Base
	belongs_to :race
	validates_presence_of :race_id

	has_attached_file :img, styles: {
	    thumb: '200x150>'
	 }
end