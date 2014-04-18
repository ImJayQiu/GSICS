require 'test_helper'

class ItReservationsControllerTest < ActionController::TestCase
  setup do
    @it_reservation = it_reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:it_reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create it_reservation" do
    assert_difference('ItReservation.count') do
      post :create, :it_reservation => @it_reservation.attributes
    end

    assert_redirected_to it_reservation_path(assigns(:it_reservation))
  end

  test "should show it_reservation" do
    get :show, :id => @it_reservation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @it_reservation.to_param
    assert_response :success
  end

  test "should update it_reservation" do
    put :update, :id => @it_reservation.to_param, :it_reservation => @it_reservation.attributes
    assert_redirected_to it_reservation_path(assigns(:it_reservation))
  end

  test "should destroy it_reservation" do
    assert_difference('ItReservation.count', -1) do
      delete :destroy, :id => @it_reservation.to_param
    end

    assert_redirected_to it_reservations_path
  end
end
