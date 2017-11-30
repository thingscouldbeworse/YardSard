class AddPromotedAndPromotedAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :promoted, :boolean
    add_column :items, :promoted_at, :datetime
  end
end
