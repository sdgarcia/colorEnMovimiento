class SessionsController < ApplicationController
  def create
  	#raise request.env['omniauth.auth'].to_yaml
  	auth = request.env["omniauth.auth"]
  	user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user
  	redirect_to '/admin', :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    render :text => "Has salido exitosamente!"
  end

  def failure
    render :text => "No has dado acceso!"
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
