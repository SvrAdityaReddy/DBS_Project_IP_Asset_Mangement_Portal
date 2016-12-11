require 'test_helper'

class CreationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creation = creations(:one)
  end

  test "should get index" do
    get creations_url
    assert_response :success
  end

  test "should get new" do
    get new_creation_url
    assert_response :success
  end

  test "should create creation" do
    assert_difference('Creation.count') do
      post creations_url, params: { creation: { creation_id: @creation.creation_id, creator_id: @creation.creator_id, ip_flag: @creation.ip_flag, ip_policy: @creation.ip_policy, liabilities: @creation.liabilities, proposal: @creation.proposal, royalty: @creation.royalty, title: @creation.title, tp: @creation.tp } }
    end

    assert_redirected_to creation_url(Creation.last)
  end

  test "should show creation" do
    get creation_url(@creation)
    assert_response :success
  end

  test "should get edit" do
    get edit_creation_url(@creation)
    assert_response :success
  end

  test "should update creation" do
    patch creation_url(@creation), params: { creation: { creation_id: @creation.creation_id, creator_id: @creation.creator_id, ip_flag: @creation.ip_flag, ip_policy: @creation.ip_policy, liabilities: @creation.liabilities, proposal: @creation.proposal, royalty: @creation.royalty, title: @creation.title, tp: @creation.tp } }
    assert_redirected_to creation_url(@creation)
  end

  test "should destroy creation" do
    assert_difference('Creation.count', -1) do
      delete creation_url(@creation)
    end

    assert_redirected_to creations_url
  end
end
