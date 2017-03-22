class Api::V1::SessionsController < DeviseController
  skip_before_action :verify_authenticity_token  
  before_action :authenticate_user!, except: [:create]
  before_action :ensure_params_exist, only: [:create]
  respond_to :json

  def create
    resource = User.find_for_database_authentication(:email=>params[:user_login][:email])
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user_login][:password])
      # render json: {error: true} unless
      sign_in("user", resource)
      render json: { success: true, auth_token: resource.authentication_token, email: resource.email}, status: :ok
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    current_user.reset_authentication_token
    render json: { success: true }, status: :ok
  end

  protected
    def ensure_params_exist
      return unless params[:user_login].blank?
      render json: { success: false, message: "missing user_login parameter" }, :status => 422
    end
  
    def invalid_login_attempt
      render json: { success: false, message: "Error with your login or password"}, status: :unauthorized
    end
  
end