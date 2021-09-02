import React from 'react';
import logo from './logo.svg';
import './App.css';
import myimg from "./myimg.png";


import {keycloak_js} from "keycloakify";

function App() {
  return (
    // <div className="App">
    //   <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />
    //     <p>
    //       Edit <code>src/App.tsx</code> and save to reload.
    //     </p>
    //     <a
    //       className="App-link"
    //       href="https://reactjs.org"
    //       target="_blank"
    //       rel="noopener noreferrer"
    //     >
    //       Learn React
    //     </a>
    //   </header>
    // </div>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <img src={myimg} alt="test_image" />
          <p style={{ "fontFamily": '"Work Sans"' }}>Hi, Everyone!</p>
        </header>
      </div>
  );
}

export default App;
