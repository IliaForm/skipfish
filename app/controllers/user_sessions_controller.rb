﻿class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
    layout "layouts/applicationlena"
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to account_url
    else
      flash[:notice] = "Login unsuccessful!"
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    #flash[:notice] = "Logout successful!"
    redirect_to new_user_session_url
  end
end

