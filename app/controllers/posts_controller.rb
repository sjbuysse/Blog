class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] 

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
        @comment = @post.comments.new
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

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        flash[:success] = "Successfully deleted post"
        redirect_to root_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :thumb)
    end
end
