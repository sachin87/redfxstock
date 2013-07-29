module ApplicationHelper

  def sign_in_page?
    params[:controller] == 'devise/sessions' && params[:action] == 'new'
  end

end
