require 'test_helper'

class VisitTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visit_type = visit_types(:one)
  end

  test "should get index" do
    get visit_types_url
    assert_response :success
  end

  test "should get new" do
    get new_visit_type_url
    assert_response :success
  end

  test "should create visit_type" do
    assert_difference('VisitType.count') do
      post visit_types_url, params: { visit_type: { name: @visit_type.name } }
    end

    assert_redirected_to visit_type_url(VisitType.last)
  end

  test "should show visit_type" do
    get visit_type_url(@visit_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_visit_type_url(@visit_type)
    assert_response :success
  end

  test "should update visit_type" do
    patch visit_type_url(@visit_type), params: { visit_type: { name: @visit_type.name } }
    assert_redirected_to visit_type_url(@visit_type)
  end

  test "should destroy visit_type" do
    assert_difference('VisitType.count', -1) do
      delete visit_type_url(@visit_type)
    end

    assert_redirected_to visit_types_url
  end
end
