class RequestsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.valid?
      doc = Nokogiri::XML(open(url @request))
      selection = { titles: doc.xpath("//title_without_series"),
                    names: doc.xpath("//name"),
                    links: doc.xpath("//book//link"),
                    image: doc.xpath("//book//image_url")}
      sleep(1)
      #flash[:notice] = 'Request recieved. Check your email.'
    else
      render :new
    end
  end

  private
    def request_params
      params.require(:request).permit(:id, :email, :quantity)
    end

    def url(request)
      "https://www.goodreads.com/review/list/" \
      "#{request.id}.xml?key=#{ENV['goodreads_key']}" \
      "&v=2&sort=random&shelf=to-read&per_page=#{request.quantity}"
    end
end
