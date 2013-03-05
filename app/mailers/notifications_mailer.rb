class NotificationsMailer < ActionMailer::Base
  default :from => "franco@colorenmovimiento.com"
  default :to => "hola@ColorEnMovimiento.com"

  def new_message(message)
    @message = message
    mail(:subject => "ColorEnMovimiento #{message.subject}")
  end
end
