class CallbacksController < Devise::CallbacksController

    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    def tumblr
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    def instagram
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end


  def failure
    redirect_to root_path
  end
end