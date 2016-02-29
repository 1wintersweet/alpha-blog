# controller test is for verifying all the paths are correct

require 'test_helper'

class CategoriesControllerTest <ActionController::TestCase
  
  def setup
    # create one sample category
    @category = Category.create(name: "sports")
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end


  test "should get categories index" do
    get :index # http get method
    assert_response :success
  end
  
  test "should get new" do
    #simulate user as login 
    session[:user_id] = @user.id
    get :new
    assert_response :success
    
  end
  
  test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  
  # only admin user can create categories
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "sports"}
    end
    assert_redirected_to categories_path
    
  end
  
  
end
