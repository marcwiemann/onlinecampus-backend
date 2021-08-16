import React,  {useState}  from "react";
import { BrowserRouter as Router} from "react-router-dom";
import {NavigationBar} from "./components/NavigationBar";
import {MainPage} from "./components/main";

export default function App() {
  const [activeBurger, setActiveBurger] = useState(true);
  const showResponsiveNavigation = activeBurger === false? "resposiveDisplay" : "";
  return (
    <div className="bodyHome">
      <Router>
        <NavigationBar showResponsiveNavigation={showResponsiveNavigation}/>
        <MainPage />
      </Router>
    </div>
  );
}


