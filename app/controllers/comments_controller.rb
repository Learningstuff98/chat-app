class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    chatroom = Chatroom.find(params[:chatroom_id])
    chatroom.comments.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
