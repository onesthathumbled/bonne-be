class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    begin
      user = get_user_from_token
      render json: {
        message: "If you see this, you're in!",
        user: user
      }
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end

  private

  def get_user_from_token
    authorization_header = request.headers['Authorization']

    if authorization_header && authorization_header.include?('Bearer ')
      token = authorization_header.split('Bearer ')[1]
      jwt_payload = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key]).first
      user_id = jwt_payload['sub']
      return User.find(user_id)
    end

    raise JWT::DecodeError, 'Invalid or missing Authorization header'
  end
end
