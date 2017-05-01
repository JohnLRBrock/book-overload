class Request
  include ActiveModel::Model
  attr_accessor :id, :email, :quantity

  validates_format_of :email, with: /.+@.+/
  validates_format_of :id, with: /[0-9]+/
  validate :in_valid_range

  def in_valid_range
    min_quantity = 1
    max_quantity = 10
    unless @quantity.to_i.between?(min_quantity, max_quantity)
      errors.add(:base, "Quantity must be between #{min_quantity} and #{max_quantity}")
    end
  end
end
