class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    console
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash.notice = 'User Created'
      redirect_to @user
    else
      flash.notice = "Error : #{@user.errors.messages}"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :city_id)
  end
end
