class Api::V1::TestController < ApplicationController
  def index
    render json: { message: "Hello World"}
  end
  
  def create
    puts params[:user]
    render json: { message: "createが実行されました"}
  end
end
