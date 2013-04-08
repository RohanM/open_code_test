class SessionsController < ApplicationController
  def create
    @user = User.find_by_nickname(nickname)

    if @user
      @user.oauth_token = oauth_token
      @user.save!
    else
      @user = User.create! nickname: nickname, oauth_token: oauth_token
    end

    session[:user_id] = @user.id

    redirect_to new_test_path
  end

  def failure
  end


  protected

  def nickname
    auth_hash[:info][:nickname]
  end

  def oauth_token
    auth_hash[:credentials][:token]
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
