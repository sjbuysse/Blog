class PicturesController < ApplicationController
    def create
       @picture = Picture.new(picture_params)  
       @picture.save
    end
    
    def destroy
        @picture = Picture.find(params[:id])  
        @picture.destroy
        redirect_to edit_post_path(params[:post_id])
    end

    private
    def picture_params
        params.require(:picture).permit(:image)
    end
end
