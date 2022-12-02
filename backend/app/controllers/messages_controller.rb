class MessagesController < ApplicationController
    #メッセージの作成
    def create
        # message = Message.new(user_id: current_user.id, room_id: params[:id], message: params[:message])
        message = Message.new(message_params)
        if message.save
            render json: message
        else
            render json: message.errors, status: 422
        end
    end

    private
    def message_params
      params.permit(:user_id, :room_id, :message)
    end
end

