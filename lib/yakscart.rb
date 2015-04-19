require "yaks-sinatra"
require "yaks-html"

module Yakscart
  class Application < Sinatra::Base
    register Sinatra::Yaks
    helpers Sinatra::YaksHelpers

    configure_yaks do
      mapper_namespace Yakscart
    end

    get '/' do
      yaks Product.all
    end
  end

  class Product < Sequel::Model
  end

  class ProductMapper < Yaks::Mapper
    attributes :id, :name, :price

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
