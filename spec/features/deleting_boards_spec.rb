require "rails_helper"

RSpec.feature "Deleting boards" do
  scenario "Deleting boards" do
    FactoryGirl.create(:board, title: "Food Board")

    visit '/'
    click_link "Food Board"
    click_link "Delete Board"

    expect(page).to have_content("Board has been deleted.")

    visit '/'
    expect(page).to have_no_content("Food Board")
  end
end
