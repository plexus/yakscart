module Yakscart
  class CartMapper < Yaks::Mapper
    attributes :id, :created_at

    link :self, "/cart"

    has_many :line_items
  end
end
