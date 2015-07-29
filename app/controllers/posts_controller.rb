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
            redirect_to(post_path(@post))
        else
            flash[:error] = "Could not save post"
            render action: :new
            flash.discard(:error)
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:success] = "Successfully updated post"
            redirect_to post_path(@post)
        else
            render action: :edit
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
