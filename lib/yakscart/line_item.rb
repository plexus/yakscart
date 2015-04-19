module Yakscart
  class LineItem < Sequel::Model
    many_to_one :cart
    many_to_one :product
  end
end
