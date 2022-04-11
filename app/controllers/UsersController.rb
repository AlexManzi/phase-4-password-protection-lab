class UsersController < ApplicationController
    def create
        user = User.create!(params.permit(:username, :password, :password_confirmation))
        render json: user 
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: { errors: invalid.record.errors }, status:422
    end
end