class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to new_session_url
    end
  end


  def destroy
    cart = nil
    session[:user_id] = nil
    redirect_to new_session_url
  end
end
