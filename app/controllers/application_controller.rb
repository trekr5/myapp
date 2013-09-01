class ApplicationController < ActionController::Base
  protect_from_forgery
 
  before_filter :set_locale 


private

# extract locale from http header
  def extract_locale_from_accept_language_header
   request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z] {2} /).first
  end

# sets current user's locale
  def set_locale
   I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
  # I18n.locale = params[:locale] if params[:locale].present?
  end	


# passes the locale to the url
  def default_url_options(options = {})
   {locale: I18n.locale}
  end
end
