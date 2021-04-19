class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    chatroom = Chatroom.find(params[:chatroom_id])
    comment = chatroom.comments.create(comment_params)
    SendCommentJob.perform_later(comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
