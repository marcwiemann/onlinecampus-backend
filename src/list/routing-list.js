

const routes = [
    {
      path: "/",
      exact: true,
      main: () => <h2>Home</h2>,
    },
    {
      path: "/teams",
      main: () => <h2>Hier sind Teams</h2>,
    },
    {
      path: "/news",
      main: () => <h2>Aktuelles</h2>,
    },
    {
      path: "/about",
      main: () => <h2>Über uns</h2>,
    },
    {
      path: "/sponsor",
      main: () => <h2>Freunde und Förderer</h2>,
    },
    {
      path: "/contact",
      main: () => <h2>Kontakt</h2>,
    },
    {
      path: "/admin",
      main: () => <h2>Hier ist der Admin Berich</h2>,
    },

  ];
  /*Navigation Items */
  const NavItems = [
    {
        to: "/",
        name: "Home",
    },
    {
        to: "/teams",
        name: "Teams",
    },
    {
        to: "/news",
        name: "Aktuelles",
    },
    {
        to: "/about",
        name: "Über uns",
    },
    {
        to: "/sponsor",
        name: "Freunde und Förderer",
    },
    {
        to: "/contact",
        name: "Kontakt",
    },
];

  export {NavItems,routes};