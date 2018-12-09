import React, { Component } from "react";
import PropTypes from "prop-types";
import { Container, Header, Grid } from "semantic-ui-react";
import Navigation from "./navigation";

function LandingContent() {
  return(
    <Container>
      <Grid textAlign="right">
        <Grid.Column floated="right" href="/job_experiences/new">
          Share your experience
        </Grid.Column>
      </Grid>
      <Container text>
        <Header size="large">
          Cobble is a social platform that allows peers to share information about job and career path prospects.
        </Header>
      </Container>
    </Container>
  );
}

export default function Landing() {
  return <Navigation Content={LandingContent} />
}
