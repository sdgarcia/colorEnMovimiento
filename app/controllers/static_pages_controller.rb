class StaticPagesController < ApplicationController
  def home
  	@message = Message.new
  end

  def contact
    @message = Message.new(params[:message])
    
    respond_to do |format|
	    if @message.valid?
	      NotificationsMailer.new_message(@message).deliver
	      format.html { redirect_to '/', :notice => 'gracias por tu mensaje'}
	      #redirect_to('/', :notice => "gracias por tu mensaje")
	    else
	      flash.now.alert = "Por favor complete los datos resaltados."
	      format.html {render :action => "home"}
		end
    end
  end
end