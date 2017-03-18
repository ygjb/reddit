class Api::V1::RegistrationsController < Api::BaseApiController
  respond_to :json
  def create
    begin
    user = User.new(user_params)  
    if user.save
      render json: user.as_json(auth_token: user.authentication_token, email: user.email), status: :created
      return
    else
      warden.custom_failure!
      render json: user.errors, status: :unprocessable_entity
    end
    rescue => ex
      logger.error ex.message
      render json: {:error => ex.message}, status: 400
    end
  end
  
  private
    def user_params
      params.require(:new_user).permit(:email, :password, :password_confirmation)
    end
end