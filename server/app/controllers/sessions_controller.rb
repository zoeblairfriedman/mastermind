class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:id])
      if user && user.authenticate(params[:password])
        # new game? 
        binding.pry
      elsif user
        render json: {message: "Invalid Password"}
      else
        render json: {message: "Invalid Username"}
      end
    end

   
end
