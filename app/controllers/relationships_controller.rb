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
  def followings
    @users_follow = @user.followings
    @users_follower = @user.followers
  end
  # フォロワー一覧
  def followers
    @users_follow = @user.followers
    @users_follower = @user.followings
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end

end
