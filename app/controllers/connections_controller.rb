class ConnectionsController < ApplicationController

  def simple
    simpleSearch(params[:query])
  end

  def api
    apiHelper(params[:site][:name])
  end

  def noapi
    noapiHelper(params[:site][:name])
  end
  
end