class UserController < ApplicationController
  before_action :authenticate_user!

  def show
      @user = User.find(params[:id])
      @tutorials = Tutorial.where(user_id: params[:id]).page(params[:page]).per(12)
  end

end
