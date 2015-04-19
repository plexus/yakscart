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

end
