class UserController < ApplicationController
  before_action :require_login
  def home
  end

  def subject
  end

  def course
  end

  def instructor
  end

  private
    def require_login
      unless session[:user_id]
        redirect_to sessions_login_path
      end
    end

    # def set_user
    #   @user = User.find(params[:id])
    # end
end
