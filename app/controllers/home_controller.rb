class HomeController < ApplicationController
  before_action :login_required

  def index
    @follow_users = current_user.all_following
    @follower_users = current_user.followers
    @follower_users = Kaminari.paginate_array(@follower_users).page(params[:page]).per(5)
  end

  private

  def login_required
    unless user_signed_in?
      redirect_to tops_index_path
    end
  end
end
