class Api::V1::ListingsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @listing = Listing.all.order('created_at DESC')
    render json: @listing, status: 200
  end


  def create
    @listing = Listing.new(listings_params)
    if @listing.save
      render json: @listing , status: 200
    else
      render json: {
          success: false,
          errors: [
              {user: [I18n.t('activerecord.errors.models.user.attributes.auth.blank')]}
          ]
      },status: 401
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
        :user_id,
        :listing_id
    )
  end

end