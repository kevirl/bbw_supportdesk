require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { account_id: @ticket.account_id, caselog: @ticket.caselog, category: @ticket.category, email: @ticket.email, product: @ticket.product, solution: @ticket.solution, status: @ticket.status, title: @ticket.title, ttype: @ticket.ttype }
    end

    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket
    assert_response :success
  end

  test "should update ticket" do
    patch :update, id: @ticket, ticket: { account_id: @ticket.account_id, caselog: @ticket.caselog, category: @ticket.category, email: @ticket.email, product: @ticket.product, solution: @ticket.solution, status: @ticket.status, title: @ticket.title, ttype: @ticket.ttype }
    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end

    assert_redirected_to tickets_path
  end
end
