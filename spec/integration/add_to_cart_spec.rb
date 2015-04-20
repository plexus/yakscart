RSpec.describe "adding items to the cart" do
  include Rack::Test::Methods

  def app
    Yakscart::Application
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello World')
  end
end
