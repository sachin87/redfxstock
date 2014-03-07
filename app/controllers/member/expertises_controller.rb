module Member
  class ExpertisesController < ApplicationController

    respond_to :html, :json

    # GET /expertises
    # GET /expertises.json
    def index
      @expertises = Expertise.select('id, name').page(params[:page])

      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @expertises }
      end
    end

    # GET /expertises/1
    # GET /expertises/1.json
    def show
      @expertise = Expertise.find(params[:id])

      respond_to do |format|
        format.html # show.html.haml
        format.json { render json: @expertise }
      end
    end
  end
end
