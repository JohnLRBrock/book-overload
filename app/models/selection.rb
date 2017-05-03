# contains the response from the goodreads api
class Selection
  include ActiveModel::Model
  attr_accessor :xml, :quantity

  def books
    books = Array.new
    @quantity = [xml.xpath("//name").count, @quantity.to_i].min
    0.upto(@quantity.to_i - 1) do |i|
      params = {
                title: xml.xpath("//title_without_series")[i].content,
                name:  xml.xpath("//name")[i].content,
                link:  xml.xpath("//book//link")[i].content,
                image: xml.xpath("//book//image_url")[i].content
               }
      books << Book.new(params)
    end
    books
  end
end
