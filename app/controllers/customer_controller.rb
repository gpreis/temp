class CustomerController < ApplicationController.rb
  before_action :find_customers, only: :index

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    
  end
end
