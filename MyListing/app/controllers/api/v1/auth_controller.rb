class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    token = nil

    if user
      if user.valid_password?(params[:password])
        token = user.generate_token
      end
    end

    if token
      render json: {success: true, token: token} , status: 200
    else
      render json: {
          success: false,
          errors: [
              {user: [I18n.t('activerecord.errors.models.user.attributes.auth.blank')]}
          ]
      },status: 401
    end
  end
end