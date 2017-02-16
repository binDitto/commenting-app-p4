class SessionsController < ApplicationController

def login
  render 'login'
end

def create
  user = User.find_by(username: params[:session][:username].downcase)

  if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:success] = "Hello there #{user.username}!"
    redirect_to users_path
  else
    render 'login'
  end
end

def destroy
  session[:user_id] = nil
  flash[:danger] = "See ya laterrz!"
  redirect_to login_path
end

end
