class RacesController < ApplicationController
  layout 'admin'
  before_filter :admin_required


  def index
  	@races = Race.all
  end

  def editar
  	@race = Race.find(params[:id])

  	if params[:race]
  		if @race.update_attributes(params[:race])
  			redirect_to "/races"
  		else
  			flash[:alert] = "Error al guardar los datos"
  		end
  	end
  end

  def nueva
  	@race = Race.new

  	if params[:race]
  		if @race.update_attributes(params[:race])
  			redirect_to "/races"
  		else
  			flash[:alert] = "Error al guardar los datos"
  		end
  	end
  end

end