# Uses SuckerPunch to make a goodreads api request
class GoodreadsJob < ApplicationJob
  include SuckerPunch::Job
  workers 2

  queue_as :default

  def perform(request)
    $my_lock ||= Mutex.new
    $my_lock.lock
    doc = Nokogiri::XML(open(url request))
    selection = Selection.new(xml: doc, quantity: request.quantity)
    SelectionMailer.selection_email(selection.books, request.email).deliver_later
    # only one api request can be made to Goodreads per second
    sleep(1)
    $my_lock.unlock
  end

  def url(request)
    "https://www.goodreads.com/review/list/" \
    "#{request.id}.xml?key=#{ENV['goodreads_key']}" \
    "&v=2&sort=random&shelf=to-read&per_page=#{request.quantity}"
  end
end
