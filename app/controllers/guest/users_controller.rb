module Guest
  class UsersController < ApplicationController

    skip_before_filter :authenticate_user!

    respond_to :html, :json

    def index
      @users = User.page params[:page]
      respond_with @users
    end

    def show
      @user = User.find params[:id]
      respond_with @user
    end

  end
end
