class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description, limit: 1000
      t.string :pic
      t.integer :price_cents
      t.integer :ad_price_cents
      t.belongs_to :yard_sale, index: true

      t.timestamps
    end
  end
end
