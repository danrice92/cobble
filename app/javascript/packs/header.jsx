import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import { Menu, Header } from "semantic-ui-react";

export default class Application extends React.Component {
  render() {
    return (
      <Menu className="header">
        <Menu.Item href="/" className="header-option">
          Novum Opus
        </Menu.Item>
      </Menu>
    )
  }
}
