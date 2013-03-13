class Race < ActiveRecord::Base

	attr_accessible :race_date, :title, :title2, :description, :how_it_workd, :rules, :map_embed_url, :status, :eventioz_link, :docs

	validates_presence_of :title, :title2, :race_date

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
		end
	end

	has_attached_file :docs

end