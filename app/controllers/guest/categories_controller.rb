module Guest
  class CategoriesController < Devise::SessionsController

    skip_before_filter :authenticate_user!

    respond_to :html, :json

    def index
      self.resource = resource_class.new
      clean_up_passwords(resource)
      serialize_options(resource)
      @categories = Category.order(:name).select('id, name').page params[:page]
    end

    # GET /categories/1
    # GET /categories/1.json
    def show
      @category = Category.find(params[:id])
      respond_with @category
    end

    protected

    def sign_in_params
      devise_parameter_sanitizer.sanitize(:sign_in)
    end

    def serialize_options(resource)
      methods = resource_class.authentication_keys.dup
      methods = methods.keys if methods.is_a?(Hash)
      methods << :password if resource.respond_to?(:password)
      { :methods => methods, :only => [:password] }
    end

    def auth_options
      { :scope => resource_name, :recall => "#{controller_path}#new" }
    end

  end
end
