module Yakscart
  class HomeMapper < Yaks::Mapper
    link '/rels#products', '/products'
  end
end
