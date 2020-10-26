class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  # def create
  #   if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
  #     message = Message.create(message_params)
  #     render json:{ message: message }
  #   else
  #     flash[:alert] = "メッセージ送信に失敗しました。"
  #   end
  # end

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      respond_to do |format|
        # binding.pry
        format.html { redirect_to "room_path(params[:room_id])" }
        format.json
      end
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
  end

  private
  def message_params
    params.require(:message).permit(:content,:room_id).merge(user_id: current_user.id)
  end
end

