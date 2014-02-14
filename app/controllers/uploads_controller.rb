class UploadsController < ApplicationController

  before_filter :load_upload, only: [:edit, :update, :destroy]

  respond_to :html, :json

  def index
    if params[:tag]
      @uploads = Upload.includes(:gallery).tagged_with(params[:tag]).page(params[:page])
    else
      @uploads = Upload.includes(:gallery).page(params[:page])
    end
  end

  def new
    @upload = current_user.uploads.new(:gallery_id => params[:gallery_id])
  end

  def create
    @upload = current_user.uploads.new(params[:upload])
    @upload.save
    respond_with @upload
  end

  def show
    @upload = Upload.includes(:gallery).find(params[:id])
    @comment = @upload.comments.new
    @comment.user = current_user
  end

  def edit
  end

  def update
    @upload.update_attributes(params[:upload])
    respond_with @upload
  end

  def destroy
    @upload.destroy
    respond_with @upload
  end

  private

    def load_upload
      @upload = current_user.uploads.find(params[:id])
    end

end