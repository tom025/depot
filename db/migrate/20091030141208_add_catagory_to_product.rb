class AddCatagoryToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :catagory_id, :integer
  end

  def self.down
    remove_column :products, :catagory_id
  end
end
