class CommentsController < ApplicationController

  respond_to :json, :xml

  before_filter :load_comment, only: [:edit, :show, :update, :destroy]
  before_filter :find_upload, only: [:create, :update]

  def index
    @comments = Comment.all
    respond_with @comments
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @upload.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @upload, notice: "Comment created."
    else
      render 'uploads/show'
    end
  end

  def edit
  end

  def update
    @comment.update_attributes(params[:comment])
    respond_with @comment
  end

  def destroy
    @comment.destroy
    respond_with @comment
  end

  private

    def load_comment
      @comment = Comment.find params[:id]
    end

    def find_upload
      @upload = Upload.find params[:upload_id]
    end

end
