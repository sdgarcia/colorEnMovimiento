class Race < ActiveRecord::Base

	attr_accessible :race_date, :title, :title2, :description, :how_it_workd, :rules, :map_embed_url, :status, :eventioz_link

	validates_presence_of :title, :title2, :race_date

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

end