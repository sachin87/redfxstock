class Admin::AdminController < ::ApplicationController

  load_and_authorize_resource

  respond_to :html, :json

  before_filter :verify_admin
  before_filter :load_resource, except: [:index, :new, :create]

  def index
    @resources = klass.all
    respond_with([:admin, @resource])
  end

  def new
    @resource = klass.new
    respond_with([:admin, @resource])
  end

  def create
    @resource = klass.new(params[params_attr])
    @resource.save
    respond_with([:admin, @resource])
  end

  def edit
    respond_with([:admin, @resource])
  end

  alias_method :show, :edit

  def update
    @resource.update_attributes((params[params_attr]))
    respond_with([:admin, @resource])
  end

  def destroy
    @resource.destroy
    respond_with([:admin, @resource])
  end

  private

    def klass
      @klass ||= model_name_symbolized.constantize
    end

    def model_name_symbolized
      @model_name ||= params[:controller].split('/').last.singularize.capitalize
    end

    def params_attr
      @params_attr ||= params[:controller].split('/').last.singularize.downcase
    end

    def load_resource
      @resource = klass.find params[:id]
    end

    def verify_admin
      if !current_user.try(:admin?) && !current_user.try(:super_admin?)
        redirect_to root_url
      end
    end

end