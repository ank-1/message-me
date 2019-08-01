class SessionsController < ApplicationController
  def new
     @user=User.new
  end

  def create
    user=User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash.now[:success]= "You have successfully logged in."
      session[:user_id]=user.id
      redirect_to root_path
    else
      flash[:error]="Incorrect credentials! Try again"
      render 'new'
    end
  end

  def destroy
    session[:user_id]=nil
    flash[:success]="You have successfully logged out"
    redirect_to login_path
  end
end
