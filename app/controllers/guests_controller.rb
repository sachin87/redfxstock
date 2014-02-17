class GuestsController < ApplicationController

  skip_before_filter :authenticate_user!

  def index
    @categories = Category.order(:name)
  end

end
