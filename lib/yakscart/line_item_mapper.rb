module Yakscart
  class LineItemMapper < Yaks::Mapper
    alias line_item object

    attributes :quantity, :description, :total

    link '/rels#product', '/product/{product_id}'

    def description
      line_item.product.name
    end

    def total
      line_item.product.price * line_item.quantity
    end

    form :change_quantity do
      action "/cart/line_items"
      method "POST"
      media_type "application/x-www-form-urlencoded"

      hidden :product_id, value: ->{ line_item.product_id }
      number :quantity, value: ->{ line_item.quantity }
    end

    form :delete do
      action "/cart/line_items"
      method "POST"
      media_type "application/x-www-form-urlencoded"

      hidden :product_id, value: 0
      number :quantity, value: ->{ line_item.quantity }
    end
  end
end
