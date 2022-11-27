class RoomsController < ApplicationController
    before_action :authenticate_user!
    #自分が取引しているDM欄
    def index
        #降順(新しい順)に並び替え
        rooms = current_user.rooms.order(created_at: :desc)
        rooms_array = rooms.map do |room|
            {
                id:room.id,
                current_user: room.users.where(id: current_user.id)[0],
                other_user: room.users.where.not(id: current_user.id)[0],
                last_message: room.messages[-1]
            }
        end
        # rooms = Room.all
        render json:rooms_array
    end

    #Roomの作成 取引開始後に起動
    def create
        isRoom =false
        #自分のuid
        my_entry =Entry.where(user_id: current_user.id)
        #出品者のuidを取得
        other_entry = Entry.where(user_id: params[:id])
        #自分と出品者が同じroom_idを持つとき部屋を作成
        my_entry.each do |me|
            other_entry.each do |oe|
                if me.room_id == oe.room_id
                    isRoom =true
                end
            end
        end
        #roomを持つ場合、roomを探す
        if isRoom
            my_entry =Entry.where(user_id: current_user.id)
            other_entry =Entry.where(user_id: params[:id])
            my_entry.each do |me|
                other_entry.each do |oe|
                    if me.room_id == oe.room_id
                        room = Room.find_by(id: me.room_id)
                        render json: room
                    end
                end
            end
        #roomを持たない場合、roomを作成
        else
            room = Room.create
            #自分と出品者のroom_idを作成
            Entry.create(room_id: room.id, user_id: current_user.id)
            Entry.create(room_id: room.id, user_id: params[:id])
            room = Room.find_by(id: room.id)
            render json: room
        end
    end

    #Roomの詳細　メッセージのやり取りなど
    def show
        room = Room.find_by(id: params[:id])
        #自分以外のuserを全て取得
        other_user = room.users.where.not(id: current_user.id)[0]
        #昇順(古い順)に並び替え
        messages = room.messages.order(created_at: :asc)

        render json: { other_user: other_user, messages: messages }
    end
end
