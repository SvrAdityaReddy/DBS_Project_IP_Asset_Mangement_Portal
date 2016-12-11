require 'test_helper'

class OwnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @own = owns(:one)
  end

  test "should get index" do
    get owns_url
    assert_response :success
  end

  test "should get new" do
    get new_own_url
    assert_response :success
  end

  test "should create own" do
    assert_difference('Own.count') do
      post owns_url, params: { own: { email: @own.email, precentage: @own.precentage } }
    end

    assert_redirected_to own_url(Own.last)
  end

  test "should show own" do
    get own_url(@own)
    assert_response :success
  end

  test "should get edit" do
    get edit_own_url(@own)
    assert_response :success
  end

  test "should update own" do
    patch own_url(@own), params: { own: { email: @own.email, precentage: @own.precentage } }
    assert_redirected_to own_url(@own)
  end

  test "should destroy own" do
    assert_difference('Own.count', -1) do
      delete own_url(@own)
    end

    assert_redirected_to owns_url
  end
end
