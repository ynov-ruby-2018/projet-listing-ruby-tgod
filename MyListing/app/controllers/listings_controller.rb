class ListingsController < ApplicationController

  before_action :authenticate_user!, :except =>[:index]

  def index
    @listing = Listing.search(params[:search])
    if @listing.blank?
      @listing = Listing.all.order('created_at DESC')
    end
    @message = Message.new
  end

  def new
    @listing = Listing.new
    @listing.build_picture
  end

  def create
    @listing = Listing.new(listings_params)
    if @listing.save
      redirect_to listings_en_path
    else
      redirect_to new_listing_en_path
    end
  end

  private

  def listings_params
    params.require(:listing).permit(
        :titre,
        :description,
        :prix,
        :category_id,
        picture_attributes: [:file]).merge(user_id: current_user.id)
  end

  def messages_params
    params.require(:message).permit(
        :contenu,
        :user_id
    )
  end


end