class RandomPlaceController < ApplicationController
  def random
    @places = Place.all
    @places = @places[rand(@places.length)]
    
    respond_to do |format|
      format.html
      format.json { render :json => @places }
    end
  end
end
