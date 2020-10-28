class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @follow_users = current_user.all_following
    @follower_users = current_user.followers
    # @users_mutual = @follow_users && @follower_users
  end
end
