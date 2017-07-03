class ConnectionsController < ApplicationController

  def simple
    simpleSearch(params[:query])
  end

  def api
    load '/Users/kentomukai/ap/lib/opendata/update/API/get_itdb.rb'
  end

end