import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import { Container, Header } from "semantic-ui-react";

export default class Landing extends React.Component {
  render() {
    return(
      <Container text>
        <Header size="large">
          Novum Opus is a social platform that allows peers to share information about job and career path prospects.
        </Header>
      </Container>
    );
  }
}
