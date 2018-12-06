import React, { Component } from "react";
import PropTypes from "prop-types";
import { Container, Header, Form, Input, Select, TextArea, Button } from "semantic-ui-react";
import Navigation from "./navigation";

class NewJobExperienceContent extends Component {
  render() {
    return(
      <Container>
        <Header size="medium">Create a job experience</Header>
        <Form>
          <Form.Field control={Input} id="Position" label="Job Position" placeholder="Cashier" />
          <Form.Field control={Input} id="Company" label="Company" placeholder="WalMart" />
          <Form.Field control={Input} id="City" label="City" placeholder="Loveland" />
          <Form.Field control={Input} id="State" label="State" placeholder="CO" />
          <Form.Field control={TextArea} id="Experience" label="Experience" placeholder="This job was easy, but the pay was horrible." />
          <Form.Field control={TextArea} id="Pay" label="Pay" placeholder="I got paid $11/hour. There were no other major perks to the job." />
          <Form.Field control={TextArea} id="Recommendation" label="Recommendation" placeholder="If you need a job really badly, you could do worse than this. Otherwise, stay away!" />
          <Form.Field control={Input} id="Website" label="Website" placeholder="www.walmart.com" />
          <Form.Field control={Button}>Submit</Form.Field>
        </Form>
      </Container>
    )
  }
}

export default function NewJobExperience() {
  return <Navigation Content={NewJobExperienceContent} />
}
