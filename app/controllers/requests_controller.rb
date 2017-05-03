class RequestsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  def new
    @request = Request.new
  end

  def create
    request = Request.new(request_params)
    if request.valid?

      GoodreadsJob.new.perform(request)

      # add error handling for errors like 404, 500, etc.

      #flash[:notice] = 'Request recieved. Check your email.'
    else
      render :new
    end
  end

  private
    def request_params
      params.require(:request).permit(:id, :email, :quantity)
    end
end
