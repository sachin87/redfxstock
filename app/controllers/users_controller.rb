class UsersController < ApplicationController

  respond_to :html, :json

  # GET /users
  # GET /users.json
  def index
    @users = User.page params[:page]
    respond_with @users
  end

  # GET /users/1
  # GET /users/1.json
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
