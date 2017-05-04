# contains the response from the goodreads api
class Selection
  attr_accessor :xml, :quantity
  include ActiveModel::Model

  def books
    books = Array.new
    @quantity = [xml.xpath("//name").count, @quantity.to_i].min
    0.upto(@quantity.to_i - 1) do |i|
      book = {
                title: xml.xpath("//title_without_series")[i].content,
                name:  xml.xpath("//name")[i].content,
                link:  xml.xpath("//book/link")[i].content,
                image: xml.xpath("//book/image_url")[i].content
               }
      books << book
    end
    books
  end
end
