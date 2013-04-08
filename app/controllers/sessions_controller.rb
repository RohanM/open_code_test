class SessionsController < ApplicationController
  def create
    # auth_hash[:credentials][:token]
    # auth_hash[:info][:nickname]

    session[:token] = auth_hash[:credentials][:token]

    redirect_to root_path
  end

  def failure
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
