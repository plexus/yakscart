RSpec.describe Yakscart::ProductMapper do
  include_context "yaks context"

  let(:mapper) { Yakscart::ProductMapper.new(yaks_context) }

  it "should map attributes" do
    # Pretty print the output so we can inspect and, if all good, paste into the test
    # puts mapper.call(Yakscart::Product.new(name: "guitar", price: 5500)).pp

    expect(mapper.call(Yakscart::Product.new(name: "guitar", price: 5500)))
      .to eql Yaks::Resource.new(
        type: "product",
        attributes: {id: nil, name: "guitar", price: 55},
        forms: [
          Yaks::Resource::Form.new(
            name: :add_to_cart,
            action: "/cart/line_items",
            method: "POST",
            media_type: "application/x-www-form-urlencoded",
            fields: [
              Yaks::Resource::Form::Field.new(name: :product_id, type: :hidden),
              Yaks::Resource::Form::Field.new(name: :quantity, type: :number, value: 0)
            ]
          )
        ]
      )
  end
end
