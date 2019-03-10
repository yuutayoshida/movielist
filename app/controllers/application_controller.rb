class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def read(result)
    code = result['id']
    name = result['title']
    image_url = result['poster_path']
    
    {
      code: code,
      name: name,
      image_url: image_url,
    }
  end
end
