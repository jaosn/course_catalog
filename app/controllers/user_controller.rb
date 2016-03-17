require "pry-byebug"

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

  def search
    @subjects= Subject.all
    binding.pry
    if params[:search_search_button] && params[:search_subject] == "English"
      redirect_to user_home_path

    end
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
