class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(entry_params)
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @users = current_user.followings && current_user.followers
    if @users.length > 5
      @users = @users.slice(-5,5)
    end
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @rooms = Entry.where(user_id: current_user.id)
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
      # @entry = @room.entries.where.not(user_id: current_user.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:room_id, :user_id).merge(room_id: @room.id)
  end

end
