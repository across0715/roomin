# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    # if !resource.available || resource.activated_at < Time.current
    #   flash[:alert] = "このアカウントは無効です"
    #   redirect_to new_user_session_path and return
    # end
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    resource.update!(
      used: true,
      activated_at: Time.current + 1.week,
    )
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  # devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])

  # end
end
