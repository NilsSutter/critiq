const showNav = () => {
  // save navbar in variable
  const navigationBar = document.querySelector(".navbar");
  // add "sticky-nav" class when scroll down and remove class when scroll up
  if (navigationBar) {
    window.addEventListener('scroll', (event) => {
      if (window.scrollY !== 0) {
    console.log(navigationBar)
        navigationBar.classList.add("sticky-nav");
      }
      else {
        navigationBar.classList.remove("sticky-nav");
      }
    });
  };
};

export { showNav }
