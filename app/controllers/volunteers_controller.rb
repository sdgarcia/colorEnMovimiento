class VolunteersController < ApplicationController

	def new
		volunteer = Volunteer.new(params[:volunteer])

		if volunteer.save
			render :text => "alert('Tu solicitud se ha enviado!');"
		else
			render :text => "alert('Por favor, complete todos los datos.');" 
		end

	end #new


end