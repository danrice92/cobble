import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import { Menu, Header } from "semantic-ui-react";

export default class Navigation extends React.Component {
  render() {
    return (
      <Menu className="navigation">
        <Menu.Item href="/">
          Novum Opus
        </Menu.Item>
      </Menu>
    )
  }
}
