class GalleriesController < ApplicationController

  respond_to :html, :json

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.page params[:page]
    respond_with @galleries
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])
    respond_with @gallery
  end
end
