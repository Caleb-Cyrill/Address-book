class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password])
    # sets up user.id sessions
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end

  def destroyaccount
    User.destroy(session[:user_id])
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Account was successfully deleted." }
      format.json { head :no_content }
    end
  end
  
    
  end