class SessionsController < Devise::SessionsController

  skip_before_action :authenticate_user!
  before_action :load_categories, only: [:new, :index]

  respond_to :html, :json

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

  def instanciate_and_clear_password
    self.resource = resource_class.new
    clean_up_passwords(resource)
  end

  def load_categories
    @categories = Category.order(:name).select('id, name').page params[:page]
  end

end

