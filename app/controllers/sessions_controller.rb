class SessionsController < ApplicationController
  def login
    if params[:error] then @error = params[:error] end
    if params[:login_login_button]
      if params[:username]
        @user = User.find_by(username: params[:username], password: params[:password])
        if @user
          session[:user_id]=@user.id
          redirect_to user_home_path
        else
          redirect_to sessions_login_path(:error => "Wrong credentials")
        end
      end
    elsif params[:login_register_button]
      redirect_to sessions_register_path
    end
  end

  def register
    if params[:error] then @error = params[:error] end

    if params[:register_register_button]
      if params[:username]
        if params[:password] != params[:confirm]
          redirect_to sessions_register_path(:error => "Passwords do not match")
        else
          user_exists = User.find_by(username:params[:username])
          email_exists = User.find_by(email:params[:email])
          if user_exists || email_exists
            redirect_to sessions_register_path(:error => "User or Email already exists")
          else
            @user = User.create(username: params[:username], password: params[:password], email: params[:email])
            session[:user_id]=@user.id
            redirect_to user_home_path
          end
        end
      end
    elsif params[:register_cancel_button]
      redirect_to sessions_login_path
    end
  end

  def logout
    if session[:user_id] then session[:user_id] = nil end
    redirect_to user_home_path
  end
end
