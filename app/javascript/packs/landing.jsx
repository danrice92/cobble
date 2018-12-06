import React, { Component } from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import { Container, Header } from "semantic-ui-react";
import Navigation from "./navigation";

function LandingContent() {
  return(
    <Container text>
      <Header size="large">
        Novum Opus is a social platform that allows peers to share information about job and career path prospects.
      </Header>
    </Container>
  );
}

export default function Landing() {
  return <Navigation Content={LandingContent} />
}
