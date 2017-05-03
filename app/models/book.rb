# model describing books
class Book
  include ActiveModel::Model
  attr_accessor :title, :name, :link, :image
end
