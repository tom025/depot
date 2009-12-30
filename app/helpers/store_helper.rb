module StoreHelper
  def hidden_div_if(condition, atrributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end
