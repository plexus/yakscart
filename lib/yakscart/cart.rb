module Yakscart
  class Cart < Sequel::Model
    one_to_many :line_items
  end
end
