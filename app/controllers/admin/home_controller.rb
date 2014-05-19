module Admin
  class HomeController < AdminController
    skip_load_and_authorize_resource
    skip_before_action :load_resource
  end
end
