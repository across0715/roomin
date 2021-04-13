class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  helper_method :current_user
end
