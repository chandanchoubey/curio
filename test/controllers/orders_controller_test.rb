require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { active: @order.active, amount: @order.amount, comments: @order.comments, discount: @order.discount, fullfillment_date: @order.fullfillment_date, gift: @order.gift, order_number: @order.order_number, quantity: @order.quantity, rate: @order.rate } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { active: @order.active, amount: @order.amount, comments: @order.comments, discount: @order.discount, fullfillment_date: @order.fullfillment_date, gift: @order.gift, order_number: @order.order_number, quantity: @order.quantity, rate: @order.rate } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
