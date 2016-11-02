require 'pry'

class UsersController < ApplicationController
  before_action :require_user, except: [:new, :show]
  before_action :set_user, except: [:new]
  before_action :require_same_user, only: [:edit, :update]

  def new 
    @user = User.new
  end

  def create
    if @user.save
      flash[:notice] = "Welcome to Postit!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your profile was updated'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    redirect_to root_path if current_user != @user
  end
end