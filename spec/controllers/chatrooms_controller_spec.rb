require 'rails_helper'

RSpec.describe ChatroomsController, type: :controller do
  describe "new action" do
    it "should load the page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "create action" do
    it "should be able to make new chatrooms" do
      post :create, params: {
        chatroom: { name: "first chatroom" }
      }
      expect(response).to have_http_status(:found)
      expect(Chatroom.all.count).to eq 1
    end
  end
end
