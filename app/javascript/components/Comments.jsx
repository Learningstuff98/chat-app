import React, { useState, useEffect } from 'react';
import CommentForm from './CommentForm';
import consumer from "channels/consumer";

function Comments(props) {
  const [comments, setComments] = useState(props.comments);

  useEffect(() => {
    handleWebsocketUpdates();
  });

  const handleWebsocketUpdates = () => {
    consumer.subscriptions.create({channel: "ChatroomChannel"}, {
      received(data) {
        if(data.chatroom.id === props.chatroom.id) {
          setComments([...comments, data.comment]);
        }
      }
    });
  };

  return <div>
    <br/>
    <CommentForm
      root_url={props.root_url}
      chatroom={props.chatroom}
    />
    <br/><br/><br/>
    {comments.map((comment) => {
      return <h3 key={comment.id}>
        {comment.content}
        <br/><br/>
      </h3>
    })}
  </div>
}

export default Comments;
