import React, { useState } from 'react';
import CommentForm from './CommentForm';

function Comments(props) {
  const [comments, setComments] = useState(props.comments);

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
