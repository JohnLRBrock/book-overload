class RequestsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def new
    @request = Request.new
    @id = cookies.permanent[:id]
    @email = cookies.permanent[:email]
  end

  def create
    @request = Request.new(request_params)
    if @request.remember_me == "1"
      cookies.permanent[:id] = @request.id
      cookies.permanent[:email] = @request.email
    end
    if @request.valid?
      GoodreadsJob.new.perform(@request)
      # TODO: add error handling for errors like 404, 500, etc.
      #flash[:notice] = 'Request recieved. Check your email.'
    else
      render :new
    end
  end

  private
    def request_params
      params.require(:request).permit(:id, :email, :quantity, :remember_me)
    end
end
