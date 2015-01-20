require "rails_helper"

RSpec.feature "Editing Boards" do
  before do
    FactoryGirl.create(:board, title: "Food Board", description: "New example food board")

    visit '/'
    click_link "Food Board"
    click_link "Edit Board"
  end

  scenario "Updating a board" do
    fill_in "Title", with: "Newer Food Board"
    click_button "Update Board"

    expect(page).to have_content("Board has been updated.")
  end

  scenario "Updating a board with invalid attributes" do
    fill_in "Title", with: " "
    click_button "Update Board"

    expect(page).to have_content("Board has not been updated.")
  end
end
