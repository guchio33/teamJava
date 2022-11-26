class MessagesController < ApplicationController
    #メッセージの作成
    def create
        message = Message.new(user_id: current_user.id, room_id: params[:id], message: params[:message])
        if message.save
            render json: message
        else
            render json: message.errors, status: 422
        end
    end
end

