class AccountController < ApplicationController

  before_action :authenticate_user!

  def index

  end

  def contacts
    @contact = Message.where(vendeur: current_user.id).order('created_at DESC')
  end

  def user

  end

  def messages

  end

end