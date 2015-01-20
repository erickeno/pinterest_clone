 require "rails_helper"

 RSpec.feature "Creating Boards" do
   before do
     visit '/'
     click_link "New Board"
   end
   
   scenario "A user can create a new board" do
     fill_in "Title", with: "New Food Board"
     fill_in "Description", with: "A new food board for everyone."
     click_button "Create Board"

     expect(page).to have_content("Board has been created.")
   end

   scenario "A user cannot create a board without a title" do
     click_button "Create Board"

     expect(page).to have_content("Board has not been created.")
     expect(page).to have_content("Title can't be blank")
   end
 end
