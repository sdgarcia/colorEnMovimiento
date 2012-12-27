class City < ActiveRecord::Base
  attr_accessible :name, :enabled
  has_many :votes

  before_destroy :chequear_si_votado
  
  def enabled_s?
  	self.enabled? ? "Si" : "No"
  end

private
  def chequear_si_votado
  	if self.votes.size > 0 
  		self.enabled = false
  		self.save!
  		errors.add(:base, "No se puede eliminar, tiene votos")
  		return false
  	end
  end


end
