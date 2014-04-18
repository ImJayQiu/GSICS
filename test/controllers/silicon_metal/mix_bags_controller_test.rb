require 'test_helper'

class SiliconMetal::MixBagsControllerTest < ActionController::TestCase
  setup do
    @silicon_metal_mix_bag = silicon_metal_mix_bags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silicon_metal_mix_bags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silicon_metal_mix_bag" do
    assert_difference('SiliconMetal::MixBag.count') do
      post :create, silicon_metal_mix_bag: { bag_no: @silicon_metal_mix_bag.bag_no, date: @silicon_metal_mix_bag.date, operator: @silicon_metal_mix_bag.operator, remark: @silicon_metal_mix_bag.remark }
    end

    assert_redirected_to silicon_metal_mix_bag_path(assigns(:silicon_metal_mix_bag))
  end

  test "should show silicon_metal_mix_bag" do
    get :show, id: @silicon_metal_mix_bag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @silicon_metal_mix_bag
    assert_response :success
  end

  test "should update silicon_metal_mix_bag" do
    patch :update, id: @silicon_metal_mix_bag, silicon_metal_mix_bag: { bag_no: @silicon_metal_mix_bag.bag_no, date: @silicon_metal_mix_bag.date, operator: @silicon_metal_mix_bag.operator, remark: @silicon_metal_mix_bag.remark }
    assert_redirected_to silicon_metal_mix_bag_path(assigns(:silicon_metal_mix_bag))
  end

  test "should destroy silicon_metal_mix_bag" do
    assert_difference('SiliconMetal::MixBag.count', -1) do
      delete :destroy, id: @silicon_metal_mix_bag
    end

    assert_redirected_to silicon_metal_mix_bags_path
  end
end
