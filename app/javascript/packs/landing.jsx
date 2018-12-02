import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';

export default class Landing extends React.Component {
  render() {
    return(
      <p>Novum Opus is awesome you should totally use it.</p>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Landing />,
    document.body.appendChild(document.createElement('div')),
  )
})
