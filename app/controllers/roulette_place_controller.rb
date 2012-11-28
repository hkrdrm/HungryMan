class RoulettePlaceController < ApplicationController
  def spin
    @places = Place.where("category in (?)", session[:category].keys)
    @place = @places[rand(@places.length)]
    respond_to do |format|
      format.html
      format.json { render :json => @place }
    end
  end

  def index
    if (session[:category] == nil)
      c = Hash.new
    else
      c = session[:category]
    end
    @places = Place.where("category in (?)", c.keys)
    
    respond_to do |format|
      format.html
      format.json { render :json => @places }
    end
  end

  def AddCategory
    h = session[:category].nil? ? Hash.new : session[:category]
    h[params[:category]] = 1
    session[:category] = h
  end

  def AddPlace
  end
  def Create
  end
  def clear
    session[:category] = nil
    redirect_to "/roulette_place/index"
  end
  
end
