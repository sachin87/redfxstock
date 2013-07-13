class ApplicationController < ActionController::Base

  before_filter :authenticate_user!

  protect_from_forgery

  private

    def after_sign_in_path_for(resource)
      if resource.admin? || resource.super_admin?
        admin_home_path(resource)
      else
        root_path
      end
    end

end
