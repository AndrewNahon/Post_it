require 'pry'

class SessionsController < ApplicationController
  
  def new; end

  def create
    user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = 'Sorry but there was a problem with your Username or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're now logged out."
    redirect_to root_path
  end
end