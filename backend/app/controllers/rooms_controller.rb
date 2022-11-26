class RoomsController < ApplicationController
    def index
        rooms = Room.all

    def create
        @room = Room.create
        @entry1=Entry.create(room_id: @room.id,user_id: current_user.id)
        @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    end

    #
    def show
        @room = Room.find(params[:id])
        if Entry.where(user_id: current_user.id,room_id: @room.id).present?
            #
            @message = @room.messages
            #新しいメッセージの作成
            @message = Message.new
            
            @entries = @room.entries
        end
    end
end
