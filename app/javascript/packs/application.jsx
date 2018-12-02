import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';

export default class Application extends React.Component {
  render() {
    return(
      <h1>Novum Opus</h1>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Application />,
    document.body.appendChild(document.createElement('div')),
  )
})
