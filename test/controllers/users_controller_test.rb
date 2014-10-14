require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { bill_addr1: @user.bill_addr1, bill_addr2: @user.bill_addr2, bill_addr3: @user.bill_addr3, bill_addr4: @user.bill_addr4, bill_postcode: @user.bill_postcode, delivery_addr1: @user.delivery_addr1, delivery_addr2: @user.delivery_addr2, delivery_addr3: @user.delivery_addr3, delivery_addr4: @user.delivery_addr4, delivery_postcode: @user.delivery_postcode, email: @user.email, first_name: @user.first_name, lastname: @user.lastname, password_digest: @user.password_digest, phone: @user.phone }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { bill_addr1: @user.bill_addr1, bill_addr2: @user.bill_addr2, bill_addr3: @user.bill_addr3, bill_addr4: @user.bill_addr4, bill_postcode: @user.bill_postcode, delivery_addr1: @user.delivery_addr1, delivery_addr2: @user.delivery_addr2, delivery_addr3: @user.delivery_addr3, delivery_addr4: @user.delivery_addr4, delivery_postcode: @user.delivery_postcode, email: @user.email, first_name: @user.first_name, lastname: @user.lastname, password_digest: @user.password_digest, phone: @user.phone }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
