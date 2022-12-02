class PostsController < ApplicationController 

    # GET
    def index
        posts = Post.all.order(:id)
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

    def image_from_base64(b64)
      bin = Base64.decode64(b64)
      file = Tempfile.new('img')
      file.binmode
      file << bin
      file.rewind
    
      self.image = file
    end

    def change_img_params(img)
      begin
        Base64.decode64(img) #To check if thats a base64 string
        if img
          img = file_decode(img.split(',')[1],"some file name") #getting only the string leaving out the data/<format>
        end
      rescue Exception => e
        img #Returning if its not a base64 string
      end
    end

    def file_decode(base, filename)
      file = Tempfile.new([file_base_name(filename), file_extn_name(filename)])
      file.binmode
      file.write(Base64.decode64(base))
      file.close
      file
    end
    
    def file_base_name(file_name)
        File.basename(file_name, file_extn_name(file_name))
    end
    
    def file_extn_name(file_name)
        File.extname(file_name)
    end
end
