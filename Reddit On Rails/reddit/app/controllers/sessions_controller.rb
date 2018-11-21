class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credential(params[:user][:username], params[:user][:password])

    if @user
      log_in(@user)
      # redirect_to
    else
      flash[:errors] = ['Invalid username or password']
      redirect_to new_session_url
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
