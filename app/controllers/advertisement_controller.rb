class AdvertisementController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @ad = Advertisement.find(params[:id])
  end
end
