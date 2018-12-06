import React, { Component } from "react";
import PropTypes from "prop-types";
import { Container, Header, Form, Input, Select, TextArea, Button } from "semantic-ui-react";
import Navigation from "./navigation";

class NewJobExperienceContent extends Component {
  constructor(props) {
    super(props);
    this.state = {
      position: "",
      company: "",
      city: "",
      state: "",
      experience: "",
      pay: "",
      recommendation: "",
      website: ""
    };
  }

  updateField = (event) => {
    this.setState({ [event.target.id]: event.target.value });
  }

  submitForm = (event) => {
    event.preventDefault();

    fetch("/job_experiences", {
      method: "POST",
      headers: { Accept: "application/json", "Content-Type": "application/json" },
      body: JSON.stringify({ job_experience: { ...this.state } })
    })
    .then(function(response) {
      if(response.ok) { window.location.href = "/" }
    })
    .catch(function(error) {
      console.log('Bad server response', error)
    })
  }

  render() {
    const {position, company, city, state, experience, pay, recommendation, website} = this.state;

    return(
      <Container>
        <Header size="medium">Create a job experience</Header>
        <Form onSubmit={this.submitForm}>
          <Form.Field
            control={Input}
            onChange={this.updateField}
            id="position"
            label="Job Position"
            placeholder="Cashier"
            value={position}
          />
          <Form.Field
            control={Input}
            onChange={this.updateField}
            id="company"
            label="Company"
            placeholder="WalMart"
            value={company}
          />
          <Form.Field
            control={Input}
            onChange={this.updateField}
            id="city"
            label="City"
            placeholder="Loveland"
            value={city}
          />
          <Form.Field
            control={Input}
            onChange={this.updateField}
            id="state"
            label="State"
            placeholder="CO"
            value={state}
          />
          <Form.Field
            control={TextArea}
            onChange={this.updateField}
            id="experience"
            label="Experience"
            placeholder="This job was easy, but the pay was horrible."
            value={experience}
          />
          <Form.Field
            control={TextArea}
            onChange={this.updateField}
            id="pay"
            label="Pay"
            placeholder="I got paid $11/hour. There were no other major perks to the job."
            value={pay}
          />
          <Form.Field
            control={TextArea}
            onChange={this.updateField}
            id="recommendation"
            label="Recommendation"
            placeholder="If you need a job really badly, you could do worse than this. Otherwise, stay away!"
            value={recommendation}
          />
          <Form.Field
            control={Input}
            onChange={this.updateField}
            id="website"
            label="Website"
            placeholder="www.walmart.com"
            value={website}
          />
          <Form.Field
            control={Button}>Submit</Form.Field>
        </Form>
      </Container>
    )
  }
}

export default function NewJobExperience() {
  return <Navigation Content={NewJobExperienceContent} />
}
