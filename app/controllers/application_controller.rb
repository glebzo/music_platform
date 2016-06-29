class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :handle_layout

  def home
    
  end

  def handle_layout
    if request.headers['X-PJAX']
      render :layout => false
    end
  end
end
