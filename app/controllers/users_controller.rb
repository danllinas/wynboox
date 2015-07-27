class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user,
      notice: "You've successfully registered for WynBooX!"
    else
      render new_user_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "You have successfully updated your info."
    else
      redirect_to edit_user_path(@user), notice: "Error. Please update all fields."
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was destroyed.'}
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :city, :state)
    end


end
