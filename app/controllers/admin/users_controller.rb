module Admin
  class UsersController < AdminController

    def edit
      @resource = current_user
    end

    def update

    end

  end
end

