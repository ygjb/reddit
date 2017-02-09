class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protected
    def check_current_user?
      redirect_to links_path unless current_user
    end
end
