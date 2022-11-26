class RoomsController < ApplicationController
    #自分が取引しているDM欄
    def index
        #高順に並び替え
        rooms = current_user
        # rooms = Room.all
        render json:rooms
    end

    #Roomの作成 取引開始後に起動
    def create
        @room = Room.create
        @entry1=Entry.create(room_id: @room.id,user_id: current_user.id)
        @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    end

    #Roomの詳細　メッセージのやり取りなど
    def show
        @room = Room.find(params[:id])
        #自分のid、とroom_idの値が存在するか
        if Entry.where(user_id: current_user.id,room_id: @room.id).present?
            #ルームのメッセージを保存
            @message = @room.messages
            #新しいメッセージの作成
            @message = Message.new

            @entries = @room.entries
        end
    end
end
