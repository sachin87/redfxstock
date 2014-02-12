class UsersController < ApplicationController

  respond_to :html, :json

  def index
    @users = User.page params[:page]
    respond_with @users
  end

  def show
    @user = User.find params[:id]
    respond_with @user
  end

  def edit
    @resource = current_user
  end

  def update
    current_user.update_attributes(params[:user])
    respond_with current_user
  end

end
