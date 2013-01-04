class Vote < ActiveRecord::Base
  attr_accessible :city_id, :email, :other
  belongs_to :city

  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => false 

  validates_uniqueness_of :city_id, :scope => :email
  validates_uniqueness_of :other, :scope => :email

private
	def self.purge
		logger.info "Cantidad de votos al comenzar: " + Vote.all.size.to_s
		Vote.all.each{ |v|
			if Vote.count(:conditions => {:email => v.email, :city_id => v.city_id, :other => v.other }) > 1
				Vote.where(:email => v.email, :city_id => v.city_id, :other => v.other).each{ |v2|
					if v2.id != v.id
						v2.destroy
					end
				}
			end
		}
		logger.info "Cantidad de votos al terminar: " + Vote.all.size.to_s

	end

	def self.list_all
		logger.info "Cantidad de votos: " + Vote.all.size.to_s
		logger.info "----------------------------------------------------------------------"
		Vote.all.each{ |v|
			logger.info "| " + v.id.to_s.ljust(4) + "\t| " + v.email.ljust(30) + "\t| " + v.city_id.to_s.ljust(4) + "\t| " + v.other  
		}
		logger.info "----------------------------------------------------------------------"
	end
  
end
