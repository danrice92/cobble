import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import { Container } from "semantic-ui-react";

export default class Landing extends React.Component {
  render() {
    return(
      <Container>
        <p>Novum Opus is a social platform that allows peers to share information about job and career path prospects.</p>
      </Container>
    );
  }
}
