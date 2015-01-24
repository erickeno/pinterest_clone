require "rails_helper"

RSpec.feature "Viewing Pins" do
  before do
    user = FactoryGirl.create(:user)
    board = FactoryGirl.create(:board, title: "Food board")
    FactoryGirl.create(:pin, name: "Food pin", board: board, author: user)

    board_2 = FactoryGirl.create(:board, title: "Cars board")
    FactoryGirl.create(:pin, name: "Car pin", board: board_2, author: user)

    visit '/'
  end
  scenario "for a given board" do
    click_link "Food board"
    
    expect(page).to have_content("Food pin")
    expect(page).to_not have_content("Car pin")

    click_link "Food pin"
    expect(page).to have_content("Food pin")
  end
end
