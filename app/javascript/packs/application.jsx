import "@babel/polyfill";

import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import WebpackerReact from "webpacker-react";

import Landing from "./landing";
import Navigation from "./navigation";

WebpackerReact.setup({Landing});
WebpackerReact.setup({Navigation});
