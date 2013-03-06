class OptionsController < ApplicationController
  layout 'admin'
  before_filter :admin_required

  def index
  	@options = Option.all
  end

  def editar
  	@option = Option.find(params[:id])

  	if params[:option]
  		if @option.update_attributes(params[:option])
  			redirect_to "/options"
  		else
  			flash[:alert] = "Error al guardar los datos"
  		end
  	end
  end

end