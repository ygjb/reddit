class Api::BaseApiController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  
  respond_to :json
  
  protected
    def user_params
      params[:user].permit(:email, :password, :password_confirmation)
    end
    # def authenticate_user_from_token!
      
    #   ensure_params_exist(:auth_token)
    #   ensure_params_exist(:user_email)
      
    #   user = User.find_by_email(params[:user][:user_email])
    #   user = User.find_by(token_authenticatable: params[:user][:auth_token])
      
    #   if user #&& Devise.secure_compare(user.authenticatable_salt, params[:auth_token])
    #     sign_in user, store: false
    #   end
    # end
    # def ensure_params_exist param
    #   return unless params[param].blank?
    #   render :json=>{:success => false, :message => "missing #{param} parameter"}, :status => 400
    # end
end