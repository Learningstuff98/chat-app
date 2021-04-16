import React, { useState } from 'react';
import axios from 'axios';

function CommentForm(props) {
  const [input, setInput] = useState('');

  const submitComment = (formData) => {
    axios.post(`${props.root_url}chatrooms/${props.chatroom.id}/comments`, formData)
    .catch((err) => console.log(err.response.data));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    submitComment({ content: input });
    setInput('');
  };

  const commentButton = <input
    type="submit"
    value="Submit"
  />

  const commentInput = <input
    type="text"
    placeholder="Add a comment"
    id="input-element"
    size="50"
    value={input}
    onChange={e => setInput(e.target.value)}
    className="field"
  />

  return <form onSubmit={handleSubmit}>
    {commentInput}
    <br/><br/>
    {commentButton}
  </form>
}

export default CommentForm;
