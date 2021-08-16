import { Switch, Route } from "react-router-dom";
import {routes} from "./../list/routing-list";


//Main Page -> hier werden alle Pages bzw Komponenten angezeigt
export const MainPage = () =>  {
    return (
        <div className="mainPage">
          <Switch>
            {routes.map((route, index) => (
              <Route
                key={index}
                path={route.path}
                exact={route.exact}
                children={<route.main />}
              />
            ))}
          </Switch>
        </div>
    );
  }