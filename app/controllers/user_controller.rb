require "pry-byebug"

class UserController < ApplicationController
  before_action :require_login

  def home
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      @enrolls = []
      user.enrollments.each do |e|
        course = Course.find_by(id: e.course_id)
        @enrolls << course
      end
    end
  end

  def subject
  end

  def course
  end

  def instructor
  end

  def search
  end

  def do_search
    subjects= Subject.all
    if params[:search_search_button]
      if params[:search_subject] == ""
        @results = Course.search(params[:terms])
        #binding.pry
      else
        @results = []
        latte_id = Subject.search(params[:search_subject])[0].latte_id
        Course.search(params[:terms]).each do |c|
          c.relations.each do |cc|
            if cc.subject_id == latte_id
              @results << c
            end
          end
        end
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def registration
    Enrollment.new(user_id: session[:user_id], course_id: params[:registration_course_id]).save
    render :js => "window.location = 'home'"
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
