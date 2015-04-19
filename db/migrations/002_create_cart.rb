Sequel.migration do
  up do
    create_table :carts do
      primary_key :id
      Time :created_at, null: false
      Time :updated_at
    end
  end

  down do
    drop_table :carts
  end
end
