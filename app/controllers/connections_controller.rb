class ConnectionsController < ApplicationController

  def simple
    simpleSearch(params[:query])
  end

  def api
    apiHelper(params[:site][:name])
    redirect_to admin_path
  end

  def noapi
    noapiHelper(params[:site][:name])
    redirect_to admin_path
  end
  
end