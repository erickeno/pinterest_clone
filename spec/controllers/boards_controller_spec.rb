require 'rails_helper'

RSpec.describe BoardsController, :type => :controller do
  it "dispalys an error for a missing board" do
    get :show, id: "not-here"

    expect(response).to redirect_to(boards_path)

    message = "The board you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end

end
