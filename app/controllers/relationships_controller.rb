class RelationshipsController < ApplicationController
  before_action :set_user

  # フォローするとき
  def create
    following = current_user.follow(@user)

    @user.create_notification_follow!(current_user)
    if following.save!
      flash[:success] = 'ユーザーをフォローしました'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(@user)
  end
  # フォロー一覧
  # def followings
  def follow
    @mode = params[:mode]

    @users_follow = @user.followings.all.page(params[:page_1]).per(2)
    @users_follower = @user.followers.all.page(params[:page_2]).per(2)
  end
  # # フォロワー一覧
  # def followers
  #   @users_follow = @user.followings
  #   @users_follower = @user.followers
  # end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end

end
