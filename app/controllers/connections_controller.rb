class ConnectionsController < ApplicationController
  def connect
    search(params[:query])
  end
end