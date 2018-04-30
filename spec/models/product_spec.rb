require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @cat1 = Category.find_or_create_by! name: 'Apparel'
    @product1 = @cat1.products.new({
      name: "name",
      description: "A description", 
      price: 22, 
      quantity: 2, 
    })
  end

  it "is not valid witout any attributes" do
    expect(Product.new).to_not be_valid
  end

  it "is valid with all parameters" do
    expect(@product1).to be_valid
  end

  it "is not valid without a name" do
    @product1.name = nil
    expect(@product1).to_not be_valid
  end

  it "is not valid without a quantity" do
    @product1.quantity = nil
    expect(@product1).to_not be_valid
  end

  it "is not valid without a category" do
    @product1.category = nil
    expect(@product1).to_not be_valid
  end
end


