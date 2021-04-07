class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.update(used: "true")
      redirect_to :index
    else
      render root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :room_number, :password)
  end
end
