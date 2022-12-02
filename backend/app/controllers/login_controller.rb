class LoginController < ApplicationController
    def index
        if current_user #deviseヘルパーメソッド
            render json: {is_login: true, data:current_user}
        else 
            render json: {is_login: true, message: "ユーザーが存在しません"}
        end 
    end
end
