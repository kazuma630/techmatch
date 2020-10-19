class UsersController < ApplicationController
  before_action :authenticate_user!,only: [:show]

  def show
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless current_user.id == @user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.new(sign_up_params)
  #   unless @user.valid?
  #     render :new and return
  #   end
  #   session["devise.regist_data"] = {user: @user.attributes}
  #   session["devise.regist_data"][:user]["password"] = params[:user][:password]
  #   @detail = @user.build_detail
  #   render :new_detail
  # end

  # def update_detail
  #   @user = User.new(session["devise.regist_data"]["user"])
  #   @detail = Detail.new(detail_params)
  #     unless @detail.valid?
  #       render :new_detail and return
  #     end
  #   @user.build_detail(@detail.attributes)
  #   @user.update
  #   session["devise.regist_data"]["user"].clear
  #   redirect_to user_path(params[id])
  # end

  private

  # def detail_params
  #   params.require(:detail).permit(:age, :area_id, :occupation_id, :genre_id, :school, :experience_id, :language_id, :interest_id, :pr)
  # end

end
