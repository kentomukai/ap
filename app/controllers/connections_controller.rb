class ConnectionsController < ApplicationController
  def connect
    search(params[:query])
  end

  def api
    load '/Users/kentomukai/ap/lib/opendata/update/API/get_itdb.rb'
  end

end