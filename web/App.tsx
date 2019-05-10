import { RouteComponentProps, Router } from "@reach/router";
import * as React from "react";
import { hot } from "react-hot-loader";

const MyRoute: React.SFC<RouteComponentProps> = () => <div>Welcome to the App!</div>;

const App: React.SFC = () => (
  <Router>
    <MyRoute path="/" />
  </Router>
);

export default hot(module)(App);
