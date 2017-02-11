class Api::BaseApiController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  # acts_as_token_authentication_handler_for User
  respond_to :json
  
  protected
    def user_params
      params[:user].permit(:email, :password, :password_confirmation)
    end

  private
    def after_successful_token_authentication
      renew_authentication_token!
    end
end