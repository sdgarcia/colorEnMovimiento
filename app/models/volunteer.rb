class Volunteer

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :last_name, :email, :ciudad, :provestado, :pais, :cual, :tipo, :color, :contanos

  validates :name, :last_name, :email, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def save
  	if self.valid?
  		# mandar mail
  		NotificationsMailer.new_volunteer(self).deliver

  		# registrar en google docs

		# Datos para loguearse en google docs
		# ENV['USERNAME'] y ENV['EMAIL_PWD']

		

		return true
  	else
  		return false
  	end
  end

end