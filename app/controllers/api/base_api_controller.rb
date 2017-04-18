class Api::BaseApiController < ApplicationController
  abstract!
  
  private
    def render(options={})
      self.status = options[:status] || 200
      self.content_type = 'application/json'
      body = Oj.dump(options[:json], mode: :compat)
      self.headers['Content-Length'] = body.bytesize.to_s
      self.response_body = body
    end
  ActiveSupport.run_load_hooks(:action_controller, self)
end

# protected
#     def authenticate_user_with_token!
#       unless params[:user].blank?
#         user = User.find_by_email(params[:user][:user_email])
        
#         if user && Devise.secure_compare(user.token_authenticatable, params[:auth_token])
#           sign_in user, store: false
#         else
#           return invalid_login_attempt unless user
#         end
        
#         else
#           missing_params
#       end
#     end
    
#   private
#     def missing_params
#       render json: { success: false, message: "missing :user parameter" }, :status => 422
#     end
    
#     def invalid_login_attempt
#       render json: { success: false, message: "Error with your auth_token or user_email"}, status: :unauthorized
#     end