class CommentsController < ApplicationController
    before_action :find_post

    def create
        @comment = @post.comments.new(comment_params)
        if @comment.save
            redirect_to post_path(@post) 
        else
            render "posts/show"
        end
    end

    def destroy
        comment = @post.comments.find(params[:id])
        if comment.destroy
            redirect_to @post
        else
            flash[:error] = "couldn't delete comment"
            render @post
        end
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params[:comment].permit(:name, :body)
    end
end
