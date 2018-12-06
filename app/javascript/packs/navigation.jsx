import React, { Component } from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import { Menu, Container, Header, Icon, Image, Sidebar, Responsive, Segment } from "semantic-ui-react";

export default class Navigation extends Component {
  state = { visible: false }

  handlePusher = () => {
    const { visible } = this.state;
    if (visible) this.setState({ visible: false });
  };

  handleToggle = () => this.setState({ visible: !this.state.visible });

  render() {
    const { Content } = this.props;
    const { visible } = this.state;

    return (
      <div>
        <Responsive {...Responsive.onlyMobile}>
          <Sidebar.Pushable>
            <Sidebar
              as={Menu}
              className="navigation"
              animation="overlay"
              icon="labeled"
              vertical
              visible={visible}
            >
              <Menu.Item href="/">Novum Opus</Menu.Item>
            </Sidebar>
              <Sidebar.Pusher
                dimmed={visible}
                onClick={this.handlePusher}
                style={{ minHeight: "100vh" }}
              >
                <Menu className="navigation">
                  <Menu.Item onClick={this.handleToggle}><Icon name="sidebar" /></Menu.Item>
                  <Menu.Item href="/">Novum Opus</Menu.Item>
                </Menu>
                <Content />
              </Sidebar.Pusher>
          </Sidebar.Pushable>
        </Responsive>

        <Responsive minWidth={Responsive.onlyTablet.minWidth}>
          <Menu className="navigation">
            <Menu.Item href="/">Novum Opus</Menu.Item>
          </Menu>
          <Content />
        </Responsive>
      </div>
    )
  }
}
