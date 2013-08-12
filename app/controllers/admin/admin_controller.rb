class Admin::AdminController < ::ApplicationController

  load_and_authorize_resource

  respond_to :html, :json

  before_action :verify_admin
  before_action :load_resource, except: [:index, :new, :create]

  def index
    @resources = klass.all
    respond_with(@resources)
  end

  def new
    @resource = klass.new
    respond_with(@resource)
  end

  def create
    @resource = klass.new(params[@model_name])
    @resource.save
    respond_with(@resource)
  end

  def edit
    respond_with(@resource)
  end

  alias_method :show, :edit

  def update
    @resource.update_attributes((params[@model_name]))
    respond_with(@resource)
  end

  def destroy
    @resource.destroy
    respond_with(@resource)
  end

  private

    def klass
      @klass ||= model_name_symbolized.constantize
    end

    def model_name_symbolized
      @model_name ||= params[:controller].split('/').last.singularize.capitalize
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