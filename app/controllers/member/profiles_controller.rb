module Member
  class ProfilesController < ApplicationController

    respond_to :html, :json

    # GET /profiles
    # GET /profiles.json
    def index
      @profiles = Profile.page params[:page]
      respond_with(@profiles)
    end

    # GET /profiles/1
    # GET /profiles/1.json
    def show
      respond_with(profile)
    end

    # GET /profiles/1/edit
    def edit
    end

    # PUT /profiles/1
    # PUT /profiles/1.json
    def update
      profile.update_attributes(params[:profile])
      respond_with(profile)
    end

    private

    def profile
      @profile ||= current_user.profile
    end
  end
end
