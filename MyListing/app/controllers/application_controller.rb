class ApplicationController < ActionController::Base
  before_action :set_language

  def set_language
    if !session[:language]
      session[:langage] = 'en'
    end
  end
end
