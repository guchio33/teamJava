class TradesController < ApplicationController
    def index
        #出品中 自分のidとpost.user_idが同じならば、出品中
        exhibit =Post.where(user_id: current_user.id,status: 1)

        #取引中. entryテーブルからroom_idを取得
        room_id=Entry.where(user_id: current_user.id)


        render json: {exhibit: exhibit,room:room_id}


    end
end
