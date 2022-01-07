class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :introduction, :join_event)
  end

end
