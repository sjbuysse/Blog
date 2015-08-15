class PicturesController < ApplicationController
    def create
       @picture = Picture.new(picture_params)  
       @picture.save
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @picture = @post.pictures.find(params[:id])  
        @picture.destroy
        redirect_to :back
    end

    private
    def picture_params
        params.require(:picture).permit(:image)
    end
end
