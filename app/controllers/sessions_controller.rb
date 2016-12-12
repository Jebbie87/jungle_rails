class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user &&  @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      # session.errors.add(:)
      redirect_to new_session_url, :error => "test error message"
    end
  end

  def destroy
    cart = nil
    session[:user_id] = nil
    redirect_to new_session_url
  end
end
