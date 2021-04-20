# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, only: [:new, :create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)

    unless resource.used
      resource.update!(
        room_number: params[:user][:room_number],
        name: params[:user][:name],
        used: true,
        activated_at: Time.current + 1.week,
      )
      cookies.permanent.signed[:username] = params[:user][:username]
      cookies.permanent.signed[:room_number] = params[:user][:room_number]
      cookies.permanent.signed[:name] = params[:user][:name]
    end

    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def user_name_generate
    base_username = User.maximum(:id)
    @usernames = User.create!(base_username)
    @usernames.each do |username|
      @username = "#{base_url}?username= #{base_username}"
      # binding.pry
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :room_number, :name])
  end
end
