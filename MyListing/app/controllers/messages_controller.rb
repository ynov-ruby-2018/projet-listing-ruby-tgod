class MessagesController < ApplicationController

  def create
    @message = Message.new(messages_params)
    if @message.save
      redirect_to listings_en_path
    end
  end

  private

  def messages_params
    params.require(:message).permit(
        :contenu,
        :vendeur,
        :listing_id
    ).merge(user_id: current_user.id)
  end
end