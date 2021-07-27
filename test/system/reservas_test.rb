require "application_system_test_case"

class ReservasTest < ApplicationSystemTestCase
  setup do
    @reserva = reservas(:one)
  end

  test "visiting the index" do
    visit reservas_url
    assert_selector "h1", text: "Reservas"
  end

  test "creating a Reserva" do
    visit reservas_url
    click_on "New Reserva"

    fill_in "Data", with: @reserva.data
    fill_in "Descricao", with: @reserva.descricao
    fill_in "Solicitante", with: @reserva.solicitante
    fill_in "Solicitante", with: @reserva.solicitante_id
    click_on "Create Reserva"

    assert_text "Reserva was successfully created"
    click_on "Back"
  end

  test "updating a Reserva" do
    visit reservas_url
    click_on "Edit", match: :first

    fill_in "Data", with: @reserva.data
    fill_in "Descricao", with: @reserva.descricao
    fill_in "Solicitante", with: @reserva.solicitante
    fill_in "Solicitante", with: @reserva.solicitante_id
    click_on "Update Reserva"

    assert_text "Reserva was successfully updated"
    click_on "Back"
  end

  test "destroying a Reserva" do
    visit reservas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reserva was successfully destroyed"
  end
end
