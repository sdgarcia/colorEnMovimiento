#encoding: utf-8
class Race < ActiveRecord::Base

	has_attached_file :docs 
	has_attached_file :header, styles: { header: '940x174>' }

	attr_accessible :docs, :header,
		:race_date, :title, :title2, :description, :how_it_workd, :rules, :map_embed_url, :status, :eventioz_link, :sponsor_type_1, :sponsor_type_2, :sponsor_type_3

	validates_presence_of :title, :title2 

	has_many :sponsors
	has_many :charities

	def status_s
		case self.status
			when 0
				"Borrador"
			when 1
				"Publicada"
			when 2
				"Agotada"
			when 3
				"Finalizada"
			when 4
				"Próximamente lista VIP"
		end
	end

	def sponsor_type_name(i)
	 	self.attributes["sponsor_type_" + i.to_s] ? self.attributes["sponsor_type_" + i.to_s] : 
	 		( i==1 ? "Main" : i==2 ? "Color" : "City" )
	end

	

end