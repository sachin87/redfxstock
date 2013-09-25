class UploadsController < ApplicationController

  before_filter :load_upload, only: [:edit, :update, :destroy]

  def index
    @uploads = Upload.includes(:gallery).page params[:page]
  end

  def new
    @upload = current_user.uploads.new(:gallery_id => params[:gallery_id])
  end

  def create
    @upload = current_user.uploads.new(params[:upload])
    if @upload.save
      flash[:notice] = "Successfully created upload."
      redirect_to @upload.gallery
    else
      render :action => 'new'
    end
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def edit
  end

  def update
    if @upload.update_attributes(params[:upload])
      flash[:notice] = "Successfully updated upload."
      redirect_to @upload.gallery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @upload.destroy
    flash[:notice] = "Successfully destroyed upload."
    redirect_to @upload.gallery
  end

  private

    def load_upload
      @upload = current_user.uploads.find(params[:id])
    end

end