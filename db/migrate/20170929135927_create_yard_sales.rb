class CreateYardSales < ActiveRecord::Migration
  def change
    create_table :yard_sales do |t|
      t.datetime :start
      t.datetime :end
      t.integer :zip
      t.string :address
      t.belongs_to :community, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
