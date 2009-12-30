class Catagory < ActiveRecord::Base
  has_many :products

   def self.find_catagories_for_sale
    find(:all, :order => "name")
  end
end
