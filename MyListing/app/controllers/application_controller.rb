class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def set_locale
    if !session[:locale]
      session[:locale] = 'eur'
    end
  end

end
