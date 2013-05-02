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

  def archivos
    @race = Race.find(params[:id])
    @charity = Charity.new(:race_id => @race.id)
    @sponsor = Sponsor.new(:race_id => @race.id)

    if params[:race]
      if @race.update_attributes(params[:race])
        flash[:notice] = "Datos guardado"
      else
        flash[:alert] = "Error al guardar los datos"
      end
    end
    if params[:charity]
      @charity.update_attributes(params[:charity])
    end
    if params[:sponsor]
      @sponsor.update_attributes(params[:sponsor])
    end
    if params[:delete_charity].present?
      Charity.find(params[:delete_charity]).destroy
      redirect_to("/races/archivos/" + @race.id.to_s)
    end
    if params[:delete_sponsor].present?
      Sponsor.find(params[:delete_sponsor]).destroy
      redirect_to("/races/archivos/" + @race.id.to_s)
    end
    if params[:sponsor_type].present?
      @race.send("sponsor_type_" + params[:sponsor_type].to_s + "=", params[:value])
      @race.save!
      redirect_to("/races/archivos/" + @race.id.to_s)
    end
    if params[:sponsor_link].present?
      Sponsor.find(params[:sponsor_link]).update_attribute(:link_url, params[:value])
      redirect_to("/races/archivos/" + @race.id.to_s)
    end
    if params[:charity_link].present?
      Charity.find(params[:charity_link]).update_attribute(:link_url, params[:value])
      redirect_to("/races/archivos/" + @race.id.to_s)
    end

  end #archivos

end