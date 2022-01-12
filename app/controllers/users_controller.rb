class UsersController < ApplicationController

  def show
    if params[:user_id].nil?
      @user = current_user
    else
      @user = User.find(params[:user_id])
    end
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

  # def new_mail
  #   @user = current_user
  # end

  # def send_mail
  #   @user = current_user
  #   @mail_title = params[:mail_title]
  #   @mail_content = params[:mail_content]
  #   UserMailer.send_mail(@mail_title, @mail_content,@user).deliver
  # end


  private

  def user_params
    params.require(:user).permit(:user_name, :email, :profile_image, :introduction, :join_event)
  end

end
