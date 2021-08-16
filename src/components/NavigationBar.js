import {NavLink } from "react-router-dom";
import {NavItems} from "../list/routing-list";
import logo from "./../images/logo.png";

//NavigationBar Komponente -> Routing zwischen verschieden Seiten wird hier durchgefuehrt
//TODO: activeBurger in Parameter übergeben
/*<div className="burgerMenu">
                <button onClick={onClick}>{burger}</button> 
        </div>*/
export const NavigationBar = ({showResponsiveNavigation}) =>  {
    
      //const burger = activeBurger===true ? <h4>open</h4>: <h4>close</h4>;// <IoIosMenu/> : <IoCloseOutline/>;
    return (
      <div className="Header">
        <img src={logo} alt="text" className="navlogo"></img>
        <div className={`nav ${showResponsiveNavigation}`}>
          <div className="navDiv">
            {NavItems.map((navItem, index) => (
              <NavLink exact activeStyle={{color: 'var(--fomgruen)', fontWeight:"bold"}} to={navItem.to} key={index}>{navItem.icon} {navItem.name} </NavLink>
            ))}
          </div>
        </div>
        </div>
    );
  }