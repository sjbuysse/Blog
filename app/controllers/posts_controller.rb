class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] 
    before_action :find_post, only: [:show, :edit, :update, :thumbnail, :destroy]

    layout 'application', only: [:index]
    layout 'story', only: [:new, :edit, :show]

    def index
        @posts = Post.descending
    end

    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            if params[:images]
                params[:images].each do |image|
                    @post.pictures.create(image: image)
                end
            end
            flash[:success] = "Successfully created post"
            redirect_to(post_path(@post))
        else
            flash[:error] = "Could not save post"
            render action: :new
            flash.discard(:error)
        end
    end

    def show
        @comment = @post.comments.new
    end

    def edit
    end

    def update
        if @post.update(post_params)
            if params[:images]
                params[:images].each do |image|
                    @post.pictures.create(image: image)
                end
            end
            flash[:success] = "Successfully updated post"
            redirect_to post_path(@post)
        else
            flash[:error] = "Something went wrong"
            render action: :edit
        end
    end

   def destroy
        @post.destroy
        
        flash[:success] = "Successfully deleted post"
        redirect_to root_path
    end

    private
    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :body, :thumb, :author, :synopsis)
    end
end
