class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale
  
  protected
  
  def set_locale
    unless params[:lang].nil?
      session[:lang] = params[:lang]
    end
    I18n.locale = session[:lang]
  end
end
