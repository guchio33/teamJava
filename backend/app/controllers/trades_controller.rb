class TradesController < ApplicationController
    def index
        #出品中 自分のidとpost.user_idが同じならば、出品中
        exhibit =Post.where(user_id: current_user.id,status: 1)

        #取引中. entryテーブルからroom_idを取得
        room_id=Entry.where(user_id: current_user.id).pluck(:room_id)
        #roomsテーブルからpost_idの取得
        post_id=Room.where(id: room_id).pluck(:post_id)
        #取引中 postテーブルから取引している値を取得
        transaction=Post.where(id: post_id).where(status:1)
        render json: {exhibit: exhibit,transaction:transaction}
        # transaction.each do |tr|
        #     if tr.user_id == null && tr.status == 1
        #         room = Room.find_by(id: me.room_id)
        #         render json: {exhibit: exhibit,room:tr}
        #     else
        #         render json: {message: "失敗"}
        #     end
        # end
    end
end
