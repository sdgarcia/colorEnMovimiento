class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user


  protected
  def admin_required
    if session[:user_id].blank? 
    	redirect_to '/auth/google'
    else 
    	unless session[:user_id].uid == "sebastian.garcia@tangeret.com" or session[:user_id].uid =="franco@colorenmovimiento.com" or session[:user_id].uid == "akina@colorenmovimiento.com" or session[:user_id].uid == "ceneon@gmail.com" 
    		redirect_to '/failure'
    	end
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
