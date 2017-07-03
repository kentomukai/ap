class ConnectionsController < ApplicationController

  def simple
    simpleSearch(params[:query])
    render "static_pages/home"
  end

  def api
    load "#{$WORKPATH}/lib/opendata/update/API/update.rb"
    redirect_to admin_path
  end

  def noapi
    load "#{$WORKPATH}/lib/opendata/update/noAPI/update.rb"
    redirect_to admin_path
  end


end