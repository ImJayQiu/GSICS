require 'test_helper'

class SiliconMetal::SiShippingsControllerTest < ActionController::TestCase
  setup do
    @silicon_metal_si_shipping = silicon_metal_si_shippings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silicon_metal_si_shippings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silicon_metal_si_shipping" do
    assert_difference('SiliconMetal::SiShipping.count') do
      post :create, silicon_metal_si_shipping: { container_no: @silicon_metal_si_shipping.container_no, date: @silicon_metal_si_shipping.date, operator: @silicon_metal_si_shipping.operator, remark: @silicon_metal_si_shipping.remark }
    end

    assert_redirected_to silicon_metal_si_shipping_path(assigns(:silicon_metal_si_shipping))
  end

  test "should show silicon_metal_si_shipping" do
    get :show, id: @silicon_metal_si_shipping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @silicon_metal_si_shipping
    assert_response :success
  end

  test "should update silicon_metal_si_shipping" do
    patch :update, id: @silicon_metal_si_shipping, silicon_metal_si_shipping: { container_no: @silicon_metal_si_shipping.container_no, date: @silicon_metal_si_shipping.date, operator: @silicon_metal_si_shipping.operator, remark: @silicon_metal_si_shipping.remark }
    assert_redirected_to silicon_metal_si_shipping_path(assigns(:silicon_metal_si_shipping))
  end

  test "should destroy silicon_metal_si_shipping" do
    assert_difference('SiliconMetal::SiShipping.count', -1) do
      delete :destroy, id: @silicon_metal_si_shipping
    end

    assert_redirected_to silicon_metal_si_shippings_path
  end
end
