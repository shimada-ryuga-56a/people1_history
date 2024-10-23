class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: { safari: 15.0, chrome: 50, firefox: 121, ie: false }
  before_action :authenticate_user!
end
