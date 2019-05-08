class ImageController < ApplicationController
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

  	private
	    def image_params
	        params.require(:image).permit(:image)
	    end
end
