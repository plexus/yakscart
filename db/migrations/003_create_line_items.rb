Sequel.migration do
  up do
    create_table :line_items do
      primary_key :id
      Time :created_at, null: false
      Time :updated_at

      Integer :quantity

      foreign_key :cart_id, :carts
      foreign_key :product_id, :products
    end
  end

  down do
    drop_table :line_items
  end
end
