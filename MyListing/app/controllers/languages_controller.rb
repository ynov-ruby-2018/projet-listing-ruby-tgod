class LanguagesController < ApplicationController

  def show
    session[:locale] = params[:id]

      uri = URI(request.referer)
      url_hash = Rails.application.routes.recognize_path(uri.path)
      url_hash[:locale] = params[:id]
      redirect_to [url_for(url_hash), uri.query].compact.join('?')
  end

end