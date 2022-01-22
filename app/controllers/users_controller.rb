class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: [:edit, :update]

  def show
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :profile_image, :introduction, :join_event)
  end

  # def ensure_correct_user
  #   @user = User.find(params[:id])
  #   unless @user.id== current_user.id
  #     redirect_to root_path, notice: "アクセス権限がありません"
  #   end
  # end

end
