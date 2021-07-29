require "test_helper"

class ReservaTest < ActiveSupport::TestCase
  
  test "should not save reservation with requester" do
    reserva = Reserva.new(data: "2021-07-30+06%3A00%3A00+-0300", descricao: "any")
    assert_not reserva.save, "reserva doesn't have a requester"
  end

  test "should not save reservation with past date" do 
    reserva = Reserva.new(solicitante: 'aaa@email.com', data: Time.now.ago(1000), descricao: "aaaa", user_id: "1")
    assert_not reserva.save, "saved a past date"
  end

  test "should not have 2 reservas with the same due datetime" do
    reserva = Reserva.new(solicitante: 'aaa@email.com', data: Time.now, descricao: "aaaa", user_id: "1")
    reserva2 = Reserva.new(solicitante: 'aaa@email.com', data: Time.now, descricao: "aaaa", user_id: "1")
    assert_not reserva.save, "saved 2 reservas with the same due date"
  end
end
