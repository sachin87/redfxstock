module Guest
  class CategoriesController < ApplicationController

    skip_before_action :authenticate_user!
    before_action :load_categories, only: :index

    respond_to :html, :json

    def index
      respond_with @categories
    end

    def show
      @category = Category.find(params[:id])
      respond_with @category
    end

    def search
      @categories = if params[:search].present?
        Category.where(name: params[:search][:name])
      else
        Category.all
      end
      respond_with @categories
    end

    protected

    def load_categories
      @categories = Category.order(:name).select('id, name').page params[:page]
    end

  end
end
