class TagsController < ApplicationController

  respond_to :json, :xml

  before_filter :load_tag, only: [:edit, :show, :update, :destroy]

  def index
    respond_to do |format|
      format.html { @tags = Tag.all }
      format.json { render json: Upload.tokens(params[:q]) }
    end
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])
    @tag.save
    respond_with @tag
  end

  def edit
  end

  def update
    @tag.update_attributes(params[:tag])
    respond_with @tag
  end

  def destroy
    @tag.destroy
    respond_with @tag
  end

  private

    def load_tag
      @tag = Tag.find params[:id]
    end

end
