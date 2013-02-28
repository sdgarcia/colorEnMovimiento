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
	      format.js { render :text => "jQuery('#new_message input.form-textbox, #new_message textarea.form-textarea').val(''); alert('Gracias por tu mensaje'); " }
	    else
	      flash.now.alert = "Por favor complete los datos resaltados."
	      format.html {render :action => "home"}
	      format.js{ render :text => "alert('Por favor, complete todos los datos.');" }
		end
    end
  end

  def inscripcion


  end #inscripcion

  
end