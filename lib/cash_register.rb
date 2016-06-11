require 'pry'
class CashRegister
  attr_accessor :total
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def discount
    @discount
  end

  def add_item(title,price,quantity=1)
    @item_total = price * quantity
    @total += @item_total
    if quantity > 1 
      counter = quantity
      until counter < 1
        @items << title
        counter -= 1
      end
    else
      @items << title
    end
  end

  def apply_discount
    if @discount != 0 
      @total -= (@total * (@discount.to_f/100.to_f)) 
      "After the discount, the total comes to $#{@total.round}." 
    else 
      "There is no discount to apply."
    end 
  end

  def items 
    @items
  end

  def void_last_transaction
    @total -= @item_total
  end
end
