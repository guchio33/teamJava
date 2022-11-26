#ユーザー情報の詳細api

class UsersController < ApplicationController
    def index
        users=User.all
        render json: users
    end 

    #ユーザー情報
    def show
        user=User.find(params[:id])
        #自分の情報
        if user.id == current_user.id 
            my_list = 
                {
                    id:user.id,
                    icon:user.image,
                    name: user.name,
                    comment: user.comment
                }
            # rooms = Room.all
            render json:my_list
        #他の人の情報
        else
            user_list = 
                {
                    id:user.id,
                    icon:user.image,
                    name: user.name,
                    comment: user.comment
                }
            # rooms = Room.all
            render json:user_list
        end
    end

    #ユーザー情報変更
    def update
        user = User.find_by(id: params[:id])
        if user.id == current_user.id
            if user.update(user_params)
                render json: user
            else
                render json: user.errors, status: 422
            end
        else
            render json: {message: 'can not update data'}, status: 422
        end
    end

    private
    def user_params
        params.permit(:name,:image,:comment)
    end
end
