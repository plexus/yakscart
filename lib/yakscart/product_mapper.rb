module Yakscart
  class ProductMapper < Yaks::Mapper
    attributes :id, :name, :price

    link :self, "/product/{id}"

    def price
      object.price / 100
    end

    form :add_to_cart do
      action "/cart/line_items"
      method "POST"
      media_type "application/x-www-form-urlencoded"

      hidden :product_id, value: ->{ object.id }
      number :quantity, value: 0
    end
  end
end
