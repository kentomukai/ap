class ConnectionsController < ApplicationController
  def connect
    search(params[:query])
    redirect_to root_path
  end
end