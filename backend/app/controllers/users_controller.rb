#ユーザー情報の詳細api

class UsersController < ApplicationController
    def show
        #投稿者
        @user=User.find(params[:id])
        render json: @user

        #自分と投稿者を探す
        # @current_entry = Room_user.where(user_id: current_user.id)
        # render json: @current_entry
        # @another_entry = Room_user.where(user_id: @user.id)

        # unless @user.id == current_user.id #ログインしているか
        #     #同じroom_idを取得
        #     @current_entry.each do |current|
        #         @another_entry.each do |another|
        #           if current.room_id == another.room_id
        #             @is_room = true
        #             @room_id = current.room_id
        #           end
        #         end
        #     end
        #     #同じroom_idが存在しない場合、新しくインスタンスを作成。
        #     unless @is_room
        #         @room = Room.new
        #         @entry = Entry.new
        #     end
        # end
    end

end
