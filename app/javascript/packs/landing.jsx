import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';

export default class Landing extends React.Component {
  render() {
    return(
      <div>
        <h1>Novum Opus</h1>
        <p>Novum Opus is awesome you should totally use it.</p>
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Landing />,
    document.body.appendChild(document.createElement('div')),
  )
})
