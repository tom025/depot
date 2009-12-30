class Product < ActiveRecord::Base

  has_many :line_items
  belongs_to :catagory

   def self.find_products_for_sale
    find(:all, :order => "title")
  end

  validates_length_of :title, :minimum => 10,
                      :message => 'Product title must be at least 10 cheracters long'
  validates_presence_of :title, :discription, :image_url
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  validates_uniqueness_of :title
  validates_format_of :image_url,
                      :with => %r{\.(gif|jpg|png)$}i,
                      :message => 'must be a URL for GIF, JPG or PNG image'

protected
  def price_must_be_at_least_a_cent
    errors.add(:price, 'should at least be 0.01') if price.nil? || price < 0.01
  end

end


