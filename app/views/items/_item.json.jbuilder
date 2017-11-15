json.extract! item, :id, :title, :description, :pic, :price_cents, :ad_price_cents, :yard_sale_id, :created_at, :updated_at
json.url item_url(item, format: :json)
