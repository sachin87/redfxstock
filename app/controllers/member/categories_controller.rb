module Member
  class CategoriesController < ApplicationController

    #skip_before_action :authenticate_user!, only: :index

    respond_to :html, :json

    # GET /categories
    # GET /categories.json
    def index
      @categories = Category.select('id, name, parent_id, ancestry').page params[:page]
      respond_with @categories
    end

    # GET /categories/1
    # GET /categories/1.json
    def show
      @category = Category.find(params[:id])
      respond_with @category
    end
  end
end