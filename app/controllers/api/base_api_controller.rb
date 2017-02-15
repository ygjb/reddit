class Api::BaseApiController < ApplicationController
  
  protect_from_forgery unless: -> { request.format.json? }
  respond_to :json
  
  protected
    def authenticate_user_with_token!
      unless params[:user].blank?
        user = User.find_by_email(params[:user][:user_email])
        
        if user && Devise.secure_compare(user.token_authenticatable, params[:auth_token])
          sign_in user, store: false
        else
          return invalid_login_attempt unless user
        end
        
        else
          missing_params
      end
    end
    
  private
    def missing_params
      render json: { success: false, message: "missing :user parameter" }, :status => 422
    end
    
    def invalid_login_attempt
      render json: { success: false, message: "Error with your auth_token or user_email"}, status: :unauthorized
    end
end