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

      after :format do |node, env|
        next node unless node.is_a? Hexp::Node
        uri = "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['PATH_INFO']}"
        curls = Yaks::Format.media_types.map do |_, media_type|
          next if media_type =~ /html/
          H[:li, "curl -H Accept:#{media_type} #{uri}"]
        end
        node.replace('.footer') do |footer|
          Hexp::List[
            H[:br],
            H[:br],
            "To see other output formats:",
            H[:ul, curls.compact],
            footer
          ]
        end
      end
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
