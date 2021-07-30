require "test_helper"

class ReservasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end
  
  setup do
    @reserva = reservas(:one)
  end

  test "should get index" do
    get reservas_url
    assert_response :success
  end

  test "should get new" do
    get new_reserva_url
    assert_response :success
  end

  test "should create reserva" do
    assert_difference('Reserva.count') do
      post reservas_url, params: { reserva: { data: Date.tomorrow.to_time.at_noon, descricao: "any", solicitante: "any", user_id: 1 } }
    end

    assert_redirected_to reserva_url(Reserva.last)
  end

  test "should not create reserva if user_id differs from current user" do 
    assert_no_difference('Reserva.count') do
      post reservas_url, params: { reserva: { data: Date.tomorrow.to_time.at_noon.advance(hours:1), descricao: "any", solicitante: "any", user_id: 2 } }
    end  
  end
  

  test "should show reserva" do
    get reserva_url(@reserva)
    assert_response :success
  end

  test "should get edit" do
    get edit_reserva_url(@reserva)
    assert_response :success
  end

  test "should destroy reserva" do
    assert_difference('Reserva.count', -1) do
      delete reserva_url(@reserva)
    end

    assert_redirected_to reservas_url
  end
end
