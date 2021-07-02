class OmniauthController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: %i[facebook google_oauth2 github]

  def facebook
    @user = User.create_from_provider_data(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
      # set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      flash[:error] = 'a problem signing you in through Facebook'
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.create_from_provider_data(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
      # set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'a problem signing you in through google_oauth2'
      redirect_to new_user_registration_url
    end
  end

  def github
    @user = User.create_from_provider_data(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
      # set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      flash[:error] = 'a problem signing you in through github'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = "a problem signing you in"
    redirect_to new_user_registration_url
  end

  def verify_authenticity_token
    verified_request? || oauth? || raise(ActionController::InvalidAuthenticityToken)
  end
end
