# controller test is for verifying all the paths are correct

require 'test_helper'

class CategoriesControllerTest <ActionController::TestCase
  
  def setup
    # create one sample category
    @category = Category.create(name: "sports")
  end


  test "should get categories index" do
    get :index # http get method
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
    
  end
  
  test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  
end
