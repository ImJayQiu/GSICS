require 'test_helper'

class SiliconMetal::MixBagContentsControllerTest < ActionController::TestCase
  setup do
    @silicon_metal_mix_bag_content = silicon_metal_mix_bag_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silicon_metal_mix_bag_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silicon_metal_mix_bag_content" do
    assert_difference('SiliconMetal::MixBagContent.count') do
      post :create, silicon_metal_mix_bag_content: { mix_bag_id: @silicon_metal_mix_bag_content.mix_bag_id, old_bag_no: @silicon_metal_mix_bag_content.old_bag_no, operator: @silicon_metal_mix_bag_content.operator, weight: @silicon_metal_mix_bag_content.weight }
    end

    assert_redirected_to silicon_metal_mix_bag_content_path(assigns(:silicon_metal_mix_bag_content))
  end

  test "should show silicon_metal_mix_bag_content" do
    get :show, id: @silicon_metal_mix_bag_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @silicon_metal_mix_bag_content
    assert_response :success
  end

  test "should update silicon_metal_mix_bag_content" do
    patch :update, id: @silicon_metal_mix_bag_content, silicon_metal_mix_bag_content: { mix_bag_id: @silicon_metal_mix_bag_content.mix_bag_id, old_bag_no: @silicon_metal_mix_bag_content.old_bag_no, operator: @silicon_metal_mix_bag_content.operator, weight: @silicon_metal_mix_bag_content.weight }
    assert_redirected_to silicon_metal_mix_bag_content_path(assigns(:silicon_metal_mix_bag_content))
  end

  test "should destroy silicon_metal_mix_bag_content" do
    assert_difference('SiliconMetal::MixBagContent.count', -1) do
      delete :destroy, id: @silicon_metal_mix_bag_content
    end

    assert_redirected_to silicon_metal_mix_bag_contents_path
  end
end
