#encoding: utf-8
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
		session = GoogleDrive.login(ENV['USERNAME'], ENV['EMAIL_PWD'])

		# Traer la planilla "Formulario de Voluntarios"
		ssheet = session.spreadsheet_by_key('0AnwLUssfzMvvdFNXdU5jcGxWZHZZMk90dWdLMGR5Smc').worksheets[0]
		new_row = ssheet.rows.size + 1

		ssheet[new_row, 1] = self.name
		ssheet[new_row, 2] = self.last_name
		ssheet[new_row, 3] = self.email
		ssheet[new_row, 4] = self.ciudad
		ssheet[new_row, 5] = self.provestado
		ssheet[new_row, 6] = self.pais
		ssheet[new_row, 7] = self.cual
		ssheet[new_row, 8] = ([ "N/A", "Voluntario en el día de la carrera - Organizando y ayudando a los participantes.", "Voluntario en el día de la carrera - Entreteniendo y motivando.", "Voluntario para repartir los kits de participantes una semana antes de la carrera.", "Voluntario para organizar la carrera en mi ciudad.", "Voluntario en comunicación del proyecto.", "Voluntario como fotógrafo para el día de la carrera.", "Voluntario como fotógrafo para eventos previos a la carrera.", "Otro." ])[self.tipo.to_i] 
		ssheet[new_row, 9] = self.color
		ssheet[new_row, 10] = self.contanos

		ssheet.save

		return true
  	else
  		return false
  	end
  end

end