class ListingsController < ApplicationController

  before_action :authenticate_user!, :except =>[:index]

  def index
    @listing = Listing.all.order('created_at DESC')
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listings_params)
    if @listing.save
      redirect_to listings_en_path
    end
  end

  private

  def listings_params
    params.require(:listing).permit(
        :titre,
        :description,
        :prix,
        :category_id).merge(user_id: current_user.id)
  end

end