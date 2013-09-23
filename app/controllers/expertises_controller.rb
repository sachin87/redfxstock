class ExpertisesController < ApplicationController
  # GET /expertises
  # GET /expertises.json
  def index
    @expertises = Expertise.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expertises }
    end
  end

  # GET /expertises/1
  # GET /expertises/1.json
  def show
    @expertise = Expertise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expertise }
    end
  end
end
