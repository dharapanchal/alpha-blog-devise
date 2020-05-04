class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User profile updated successfully."
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def destroy
    @user.destroy
    flash[:danger] = "User and all articles have been deleted"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
