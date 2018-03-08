// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
//////import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import "phoenix_html"
import { Socket } from 'phoenix';
import CommentsList from './components/CommentsList';
import CommentBox from './components/CommentBox';

class App extends Component {
  constructor(props) {
    super(props);

    this.state = { comments: [] };
  }

  componentWillMount() {
    const socket = new Socket('/socket', {params: {auth_token: window.redditToken}})
    socket.connect()

    this.channel = socket.channel(`comments:${this.props.postId}`, {})
    this.channel.join()
      .receive('ok', resp => { this.setState({comments: resp.comments}); })
      .receive('error', resp => { console.log('Unable to join', resp) })

    this.channel.on(`comments:${this.props.postId}:new`, (data) => {
      const newComments = data.comments;
      this.setState({ comments: [...this.state.comments, ...newComments] });
    });
  }

  onCommentCreate(text) {
    this.channel.push('comment:add', { content: text });
  }

  render() {
    return (
      <div>
        <CommentBox onCommentCreate={this.onCommentCreate.bind(this)} />
        <CommentsList comments={this.state.comments} />
      </div>
    );
  }
}

window.renderCommentsApp = (target, postId) => {
  ReactDOM.render(<App postId={postId} />, document.getElementById(target));
};