class ImagesController < ApplicationController
	def new
  	@image = Image.new
  end

  def create
  	@image = Image.new(image_params)
    if @image.save
    	redirect_to new_post_path
    else
    	@image = Image.new
    	render new_post_path
    end
  end

  def destroy
    images = Image.find(params[:id])
    images.destroy
    redirect_to edit_post_path(images.post_id)
  end

  	private
	    def image_params
	        params.require(:image).permit(:image, :post_id)
	    end
end
