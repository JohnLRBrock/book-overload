# Uses SuckerPunch to make a goodreads api request
class GoodreadsJob < ApplicationJob
  include SuckerPunch::Job
  workers 1

  queue_as :default

  def perform(request)
    doc = Nokogiri::XML(open(url request))
    selection = Selection.new(xml: doc, quantity: request.quantity)
    SelectionMailer.selection_email(selection.books, request.email).deliver_now
    # only one api request can be made to Goodreads per second
    sleep(1)
  end

  def url(request)
    "https://www.goodreads.com/review/list/" \
    "#{request.id}.xml?key=#{ENV['goodreads_key']}" \
    "&v=2&sort=random&shelf=to-read&per_page=#{request.quantity}"
  end
end
