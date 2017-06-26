class ConnectionsController < ApplicationController
  def connect
    render html: params[:query]
  end
end