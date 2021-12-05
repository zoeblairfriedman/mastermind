class UsersController < ApplicationController
  
  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def index
    render json: User.all
  end


end
