module Yakscart
  class Application < Sinatra::Base
    register Sinatra::Yaks
    helpers Sinatra::YaksHelpers
    enable :sessions

    helpers do
      def find_cart
        if session[:cart_id]
          Cart[session[:cart_id]]
        else
          Cart.create.tap {|cart| session[:cart_id] = cart.id }
        end
      end
    end

    configure_yaks do
      mapper_namespace Yakscart
      rel_template 'https://yakscart.herokuapp.com/rels#{rel}'
    end

    get '/' do
      yaks :home, mapper: HomeMapper
    end

    get '/rels' do
      markdown :rels
    end


    get '/products' do
      yaks Product.all
    end

    get '/cart' do
      yaks find_cart
    end

    get '/product/:id' do
      yaks Product[params[:id]]
    end

    post '/cart/line_items' do
      cart = find_cart
      quantity, product_id = params[:quantity].to_i, params[:product_id]

      line_item = cart.line_items_dataset.first(product_id: params[:product_id])

      if line_item
        if quantity > 0
          line_item.update(quantity: quantity)
        else
          line_item.delete
        end
      else
        cart.add_line_item product_id: product_id, quantity: quantity
      end

      redirect to '/cart'
    end
  end
end
