class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Welcome #{user.name}!"
    else
      redirect_to '/sign_in'
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    session[:user_id] = nil
    flash[:notice] = "Ciao #{@user.name} - (signed out)"
    redirect_to '/sign_in'
  end

end
