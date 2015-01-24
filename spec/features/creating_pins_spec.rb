require "rails_helper"

RSpec.feature "Creating Pins" do
  let!(:user) { FactoryGirl.create(:user) }
  before do
    login_as(user)
    FactoryGirl.create(:board, title: "Food Board")

    visit '/'
    click_link "Food Board"
    click_link "New Pin"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Food Pin"
    click_button "Create Pin"

    expect(page).to have_content("Pin has been created.")
    expect(page).to have_content("Created by #{user.email}")
  end

  scenario "with missing fields" do
    click_button "Create Pin"

    expect(page).to have_content("Pin has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
