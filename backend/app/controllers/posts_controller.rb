class PostsController < ApplicationController

    # GET
    def index
        posts = Post.all.order(created_at: :desc)
        render json: posts
    end

    # GET(/posts/{id})
    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    # POST
    def create
        @post = Post.new(post_params)
        if @post.save
          render json: @post
        else
          render json: @post.errors
        end
    end
    # imageのみ、bodyから受け取る

    # PUT(PATCH)(/posts/{id})
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors
        end
    end
    
    # DELETE(/posts/{id})
    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
          render json: @post
        else
          render json: @post.errors
        end
    end

    private
    # ストロングパラメータ(?)
    def post_params
        params.permit(:title, :image, :comment, :status_id)
    #   params.permit(:title, :image, :comment, :status_id, :post_tag_relation_id)
    end
end
