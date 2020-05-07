class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

  

  def configure_permitted_parameters
    # added_attrs = [:nickname, :email, :encrypted_password]
    devise_parameter_sanitizer.permit(:sign_up, keys:[
      :nickname, :email, :encrypted_password, 
      profile_attributes:[
        :family_name, 
        :first_name, 
        :family_name_kana, 
        :first_name_kana, 
        :birth_year, 
        :birth_month, 
        :birth_day
      ]
    ])
  end
      # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      # devise_parameter_sanitizer.for(:sign_up){|user|
      # user.permit(:nickname, :email, :encrypted_password, :profile_attributes => [:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day])
      # }
end
