class PlacesController < ApplicationController
  def destroy
    places = Place.find(params[:id])
    places.destroy
    redirect_to edit_post_path(places.post_id)
  end
end
