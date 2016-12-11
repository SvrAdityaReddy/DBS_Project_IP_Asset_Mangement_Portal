require 'test_helper'

class LicenseTosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @license_to = license_tos(:one)
  end

  test "should get index" do
    get license_tos_url
    assert_response :success
  end

  test "should get new" do
    get new_license_to_url
    assert_response :success
  end

  test "should create license_to" do
    assert_difference('LicenseTo.count') do
      post license_tos_url, params: { license_to: { license_agreement: @license_to.license_agreement, name: @license_to.name, uid: @license_to.uid } }
    end

    assert_redirected_to license_to_url(LicenseTo.last)
  end

  test "should show license_to" do
    get license_to_url(@license_to)
    assert_response :success
  end

  test "should get edit" do
    get edit_license_to_url(@license_to)
    assert_response :success
  end

  test "should update license_to" do
    patch license_to_url(@license_to), params: { license_to: { license_agreement: @license_to.license_agreement, name: @license_to.name, uid: @license_to.uid } }
    assert_redirected_to license_to_url(@license_to)
  end

  test "should destroy license_to" do
    assert_difference('LicenseTo.count', -1) do
      delete license_to_url(@license_to)
    end

    assert_redirected_to license_tos_url
  end
end
