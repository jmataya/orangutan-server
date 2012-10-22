class UsersController < ApplicationController
  before_filter :signed_in_user

  respond_to :json

  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def create
    @user = User.new(params[:user])
    @user.save
    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    @message = "User destroyed successfully."
    respond_with @message
  end
end
