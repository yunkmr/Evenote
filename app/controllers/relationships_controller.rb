class RelationshipsController < ApplicationController
  before_action :set_user

  # フォローするとき
  def create
    following = current_user.follow(@user)

    # binding.pry
    # redirect_to request.referer
    if following.save!
      flash[:success] = 'ユーザーをフォローしました'
      # redirect_to @user
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      # redirect_to @user
    end
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(@user)
    # redirect_to request.referer
  end
  # フォロー一覧
  def followings
    user = User.find(@user)
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(@user)
    @users = user.followers
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end

end
