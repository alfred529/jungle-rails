require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here

    it "should save successfully with all four fields" do
      product = Product.new
      product.name = "testname"
      product.price = 12.99
      product.quantity = 35
      product.category = Category.new
      expect(product).to be_valid
    end

    it "should not save successfully without name" do
      product = Product.new
      product.name = nil
      product.price = 12.99
      product.quantity = 35
      product.category = Category.new
      expect(product).not_to be_valid
    end

    it "should not save successfully without price" do
      product = Product.new
      product.name = "testname"
      product.price = nil
      product.quantity = 35
      product.category = Category.new
      expect(product).not_to be_valid
    end

    it "should not save successfully without quantity" do
      product = Product.new
      product.name = "testname"
      product.price = 12.99
      product.quantity = nil
      product.category = Category.new
      expect(product).not_to be_valid
    end

    it "should not save successfully without category" do
      product = Product.new
      product.name = "testname"
      product.price = 12.99
      product.quantity = 35
      product.category = nil
      expect(product).not_to be_valid
    end

  end

end
