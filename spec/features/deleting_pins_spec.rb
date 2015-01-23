require "rails_helper"

RSpec.feature "Deleting Pins" do
    let!(:board) { FactoryGirl.create(:board, title: "New food board") }
    let!(:pin)   { FactoryGirl.create(:pin, name: "Food pin", board: board) }
  before do
    visit board_pin_path(board, pin)
  end

  scenario "deleting successfully" do
    click_link "Delete Pin"

    expect(page).to have_content("Pin has been deleted.")
    expect(page.current_url).to eql(board_url(board))
  end
end
