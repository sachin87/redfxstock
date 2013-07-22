module Admin
  class HomeController < AdminController
    skip_load_and_authorize_resource
    skip_before_filter :load_resource
  end
end
