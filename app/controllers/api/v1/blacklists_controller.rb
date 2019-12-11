class Api::V1::BlacklistsController < ApplicationController

   def index
      @blacklisted = Blacklist.find_by(id:1)
      render json: @blacklisted
   end

   def show
      @blacklisted = Blacklist.find_by(id:params[:id])
      render json: @blacklisted
   end

   def create
      @review = Blacklist.create(blacklist_params)
      if @blacklist.valid? 
         render json: { blacklist: BlacklistSerializer.new(@blacklist) }, status: :created
      else
         render json: { error: 'Failed to blacklist this establishment. Please try again.' }, status: :not_acceptable
      end
   end

   def destroy
      @blacklist = Blacklist.find_by(user_id:params[:id])
   end

   private
   def blacklist_params
      params.require(:blacklist).permit(:user_id, :establishment_id, :comment)
   end


end
