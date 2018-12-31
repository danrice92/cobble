import "@babel/polyfill";

import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import WebpackerReact from "webpacker-react";
// An example import and setup for future reference (set js: true in tests to make them pass):
// import Landing from "./landing";
//
// WebpackerReact.setup({Landing});

const clearFlashMessage = () => {
  const message = document.getElementById("flash-message");
  if(message) {
    setTimeout(function() { message.style.display = "none" }, 3000);
  }
}

window.onload = clearFlashMessage;
