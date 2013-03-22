class NotificationsMailer < ActionMailer::Base
  default :from => "franco@colorenmovimiento.com"
  default :to => "hola@colorenmovimiento.com"

  def new_message(message)
    @message = message
    mail(:subject => "ColorEnMovimiento #{message.subject} /#{(0...3).map{(65+rand(26)).chr}.join}")
  end

  def new_volunteer(volunteer)
  	@volunteer = volunteer
  	mail(:subject => "ColorEnMovimiento Voluntarios /#{(0...3).map{(65+rand(26)).chr}.join}", :to => "colorgang@colorenmovimiento.com")
  end #new_volunteer

end
