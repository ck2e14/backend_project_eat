class Api::V1::UsersController < ApplicationController
   # skip_before_action :authorized, only: [:create]

   def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

   def create
      @user = User.create(user_params)
      if @user.valid?
         @token = encode_token(user_id: @user.id)
         render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
       else
         render json: { error: 'Failed to create this user. Please try again.' }, status: :not_acceptable
      end
   end

   def index
      @users = User.all
      render json: @users
   end

   private
   def user_params
      params.require(:user).permit(:username, :password, :food_concern)
   end
end


