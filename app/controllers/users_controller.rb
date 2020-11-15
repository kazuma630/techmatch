class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :search_user, only: [:index, :search]
  before_action :room_check, only: [:show, :follow, :unfollow]

  def index
    @details = Detail.limit(5).order("created_at DESC")
    # set_detail_column
  end

  def show
  end

  def follow
    current_user.follow(@user)
  end

  def unfollow
    current_user.stop_following(@user)
  end

  def search
    @results = @p.result.includes(:user).where.not(user_id: current_user.id)
    @results_odd = @results.each_slice(2).map(&:first)
    @results_even = @results.each_slice(2).map(&:last)
    if @results.length.odd?
      @results_even.pop
    end
  end

  private

  def search_user
    @p = Detail.ransack(params[:q])
    @area = Area.where.not(id: 1)
    @genre = Genre.where.not(id: 1)
    @experience = Experience.where.not(id: 1)
    @language = Language.where.not(id: 1)
    @interest = Interest.where.not(id: 1)
    @occupation = Occupation.where.not(id: 1)
  end

  def detail_params
    params.require(:detail).permit(:age, :area_id, :occupation_id, :genre_id, :school, :experience_id, :language_id, :interest_id, :pr)
  end

  def room_check
    @user = User.find(params[:id])
    @currentuser_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    unless current_user.id == @user.id
      @currentuser_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
