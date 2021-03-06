class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
  skip_before_action :verify_authenticity_token, only: :facebook

  # def facebook
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])

  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
  #     set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
  #     redirect_to new_user_registration_url
  #   end
  # end

  # def google_oauth2
  #     # You need to implement the method below in your model (e.g. app/models/user.rb)
  #     @user = User.from_omniauth(request.env['omniauth.auth'])

  #     if @user.persisted?
  #       flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
  #       sign_in_and_redirect @user, event: :authentication
  #     else
  #       session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
  #       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #     end
  # end

  # def github
  #     # You need to implement the method below in your model (e.g. app/models/user.rb)
  #     @user = User.from_omniauth(request.env['omniauth.auth'])

  #     if @user.persisted?
  #       flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Github'
  #       sign_in_and_redirect @user, event: :authentication
  #     else
  #       session['devise.github_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
  #       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
  #     end
  # end

  # def failure
  #   redirect_to root_path
  # end

  # def all
  #   user = User.from_omniauth(request.env["omniauth.auth"], current_user)
  #   if user.persisted?
  #           flash[:notice] = "Successfully Authenticated!"
  #           sign_in_and_redirect(user)
  #       else
  #           session["devise.user_attributes"] = user.attributes
  #           redirect_to new_user_registration_url
  #       end
  # end

  def failure
    super
  end

  # alias_method :facebook, :all
  # alias_method :github, :all
  # alias_method :google_oauth2, :all

  def facebook
    user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    if user.persisted?
            flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Facebook'
            sign_in_and_redirect(user)
        else
            session["devise.user_attributes"] = user.attributes
            redirect_to new_user_registration_url
        end
  end

  def github
    user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    if user.persisted?
            flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Github'
            sign_in_and_redirect(user)
        else
            session["devise.user_attributes"] = user.attributes
            redirect_to new_user_registration_url
        end
  end

  def google_oauth2
    user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    if user.persisted?
            flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
            sign_in_and_redirect(user)
        else
            session["devise.user_attributes"] = user.attributes
            redirect_to new_user_registration_url
        end
  end
end