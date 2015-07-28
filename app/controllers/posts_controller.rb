class PostsController < ApplicationController
    def index
        @posts = Post.descending
    end

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = "Successfully created post"
            redirect_to(posts_path)
        else
            flash[:error] = "Could not save post"
            render action: :new
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
