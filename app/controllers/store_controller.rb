class StoreController < ApplicationController

  def index
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] = session[:counter] + 1
    end
    #@products = Product.find_products_for_sale
   # @catagories = Catagory.find_catagories_for_sale
     @catagories = Catagory.all(:order => "name, products.title",
                              :include => :products)

    @cart = find_cart
    @cat_cart = @cart.items.group_by{|cart| cart.product.catagory}
  end

  def delete_from_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @currnt_item = @cart.delete_product(product)
    @cat_cart = @cart.items.group_by{|cart| cart.product.catagory}
    respond_to do |format|
      format.js
    end
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index("Invalid product")
  end

  def remove_from_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @cat_cart = @cart.items.group_by{|cart| cart.product.catagory}
    @current_item = @cart.remove_product(product)
    respond_to do |format|
      format.js
    end
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index("Invalid product")
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart.add_product(product)
    @cat_cart = @cart.items.group_by{|cart| cart.product.catagory}
#      debugger
      respond_to do |format|
        format.js
      end
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}")
      redirect_to_index("Invalid product")
  end
  
  def empty_cart
    @cart = find_cart
    @cat_cart = @cart.items.group_by{|cart| cart.product.catagory}
    @cart.remove_all
    respond_to do |format|
        format.js
      end
  end

  def find_total_price
    @cart = find_cart
    @cat_cart = @cart.items.group_by{|cart| cart.product.catagory}
    price = @cart.total_price
    return price
  end

  def checkout
    @cart = find_cart
    @cat_cart = @cart.items.group_by{|cart| cart.product.catagory}
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end
  end

  def save_order
    @cart = find_cart
    @cat_cart = @cart.items.group_by{|cart| cart.product.catagory}
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index("Thank you for your order")
    else
      render :action => 'checkout'
    end
  end

private

 def redirect_to_index(msg = nil)
   flash[:notice] = msg if msg
   redirect_to :action => 'index'
 end
 def find_cart
  unless session[:cart]
    session[:cart] = Cart.new
  end
  session[:cart]
end

 def authorize
end


end
