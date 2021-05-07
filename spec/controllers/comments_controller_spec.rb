require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "create action" do
    it "should be able to make new comments" do
      chatroom = FactoryBot.create(:chatroom)
      post :create, params: {
        chatroom_id: chatroom.id,
        comment: {
          content: "comment content"
        }
      }
      expect(Comment.all.count).to eq 1
    end
  end
end
