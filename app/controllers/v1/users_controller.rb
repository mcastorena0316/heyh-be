module V1
  class UsersController < ApplicationController
    def create
      @user = User.create(user_params)
      if @user.valid?
        payload = { user_id: @user.id }
        token = encode_token(payload)
        render json: { user: @user, jwt: token }
      else
        render json: { errors: @user.errors.full_messages }, status: :not_acceptable
      end
    end

    def retrieve_token
      @user = User.find_by(email: params[:email])
      if @user&.authenticate(params[:password])
        payload = { user_id:@user.id }
        token = encode_token(payload)
        render json: { user: @user, jwt: token }, status: 200
      else
        render json: { failure: 'User not found'}
      end
    end

    private

    def user_params
      params.permit(:email, :name, :password)
    end
  end
end
