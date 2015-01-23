require 'rails_helper'

RSpec.feature "Deleting Pins" do
  let!(:board) { FactoryGirl.create(:board) }
  let!(:pin)   { FactoryGirl.create(:pin, board: board) }

  before do
    visit board_pin_path(board, pin)
    click_link "Edit Pin"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "New pin name"
    click_button "Update Pin"

    expect(page).to have_content("Pin has been updated.")
    expect(page).to have_content("New pin name")

    expect(page).to_not have_content(pin.name)
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Pin"

    expect(page).to have_content("Pin has not been updated.")
  end
end
