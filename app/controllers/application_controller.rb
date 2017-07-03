class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ConnectionsHelper
  load '/Users/kentomukai/ap/lib/opendata/config.rb'
end