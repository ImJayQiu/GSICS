require 'test_helper'

class SiliconMetal::PosControllerTest < ActionController::TestCase
  setup do
    @silicon_metal_po = silicon_metal_pos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silicon_metal_pos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silicon_metal_po" do
    assert_difference('SiliconMetal::Po.count') do
      post :create, silicon_metal_po: { b_size: @silicon_metal_po.b_size, contract_no: @silicon_metal_po.contract_no, customer: @silicon_metal_po.customer, date: @silicon_metal_po.date, deadline: @silicon_metal_po.deadline, destination: @silicon_metal_po.destination, grade: @silicon_metal_po.grade, p_size: @silicon_metal_po.p_size, po_code: @silicon_metal_po.po_code, product: @silicon_metal_po.product, qty: @silicon_metal_po.qty, remark: @silicon_metal_po.remark }
    end

    assert_redirected_to silicon_metal_po_path(assigns(:silicon_metal_po))
  end

  test "should show silicon_metal_po" do
    get :show, id: @silicon_metal_po
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @silicon_metal_po
    assert_response :success
  end

  test "should update silicon_metal_po" do
    patch :update, id: @silicon_metal_po, silicon_metal_po: { b_size: @silicon_metal_po.b_size, contract_no: @silicon_metal_po.contract_no, customer: @silicon_metal_po.customer, date: @silicon_metal_po.date, deadline: @silicon_metal_po.deadline, destination: @silicon_metal_po.destination, grade: @silicon_metal_po.grade, p_size: @silicon_metal_po.p_size, po_code: @silicon_metal_po.po_code, product: @silicon_metal_po.product, qty: @silicon_metal_po.qty, remark: @silicon_metal_po.remark }
    assert_redirected_to silicon_metal_po_path(assigns(:silicon_metal_po))
  end

  test "should destroy silicon_metal_po" do
    assert_difference('SiliconMetal::Po.count', -1) do
      delete :destroy, id: @silicon_metal_po
    end

    assert_redirected_to silicon_metal_pos_path
  end
end
