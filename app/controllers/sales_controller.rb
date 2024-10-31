class SalesController < ApplicationController
  def index
    @sales_data = Sale.group_by_day(:sold_on).sum(:amount)
  end
end
