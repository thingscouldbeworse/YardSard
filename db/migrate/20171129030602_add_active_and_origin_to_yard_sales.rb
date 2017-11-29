class AddActiveAndOriginToYardSales < ActiveRecord::Migration
  def change
    add_column    :yard_sales, :active, :boolean
    add_reference :yard_sales, :origin, index: true
  end
end
