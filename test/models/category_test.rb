require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    # we can create an instance variable as long as we have the model
    assert @category.valid?
  end
  
  # validates added to model name can't be empty string
  test "name should be present" do
    @category.name = " " 
    assert_not @category.valid?
  end
  
  # we arleady have a sport category
  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26 # if name field is 25 characters only
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end
