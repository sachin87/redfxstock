class SessionsController < Devise::SessionsController

  #require 'devise/parameter_sanitizer'

    def browse_by_category
      self.resource = resource_class.new
      clean_up_passwords(resource)
      serialize_options(resource)
      @categories = Category.order(:name).select('id, name').page params[:page]
      render 'guests/index'
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
