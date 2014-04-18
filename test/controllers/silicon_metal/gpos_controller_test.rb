require 'test_helper'

class SiliconMetal::GposControllerTest < ActionController::TestCase
  setup do
    @silicon_metal_gpo = silicon_metal_gpos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silicon_metal_gpos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silicon_metal_gpo" do
    assert_difference('SiliconMetal::Gpo.count') do
      post :create, silicon_metal_gpo: { gpo_code: @silicon_metal_gpo.gpo_code, po: @silicon_metal_gpo.po, weight: @silicon_metal_gpo.weight }
    end

    assert_redirected_to silicon_metal_gpo_path(assigns(:silicon_metal_gpo))
  end

  test "should show silicon_metal_gpo" do
    get :show, id: @silicon_metal_gpo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @silicon_metal_gpo
    assert_response :success
  end

  test "should update silicon_metal_gpo" do
    patch :update, id: @silicon_metal_gpo, silicon_metal_gpo: { gpo_code: @silicon_metal_gpo.gpo_code, po: @silicon_metal_gpo.po, weight: @silicon_metal_gpo.weight }
    assert_redirected_to silicon_metal_gpo_path(assigns(:silicon_metal_gpo))
  end

  test "should destroy silicon_metal_gpo" do
    assert_difference('SiliconMetal::Gpo.count', -1) do
      delete :destroy, id: @silicon_metal_gpo
    end

    assert_redirected_to silicon_metal_gpos_path
  end
end
