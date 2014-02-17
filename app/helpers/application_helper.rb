module ApplicationHelper

  def sign_in_page?
    params[:controller] == 'sessions' && params[:action] == 'new'
  end

  def images_for_carousel
    1..7
  end

end
