const showNav = () => {
  // save navbar in variable
  const navigationBar = document.querySelector('#landingpage_nav');
  // add "sticky-nav" class when scroll down and remove class when scroll up
  if (navigationBar) {
    window.addEventListener('scroll', (event) => {
      if (window.scrollY !== 0) {
        navigationBar.classList.add("sticky-nav");
      }
      else {
        navigationBar.classList.remove("sticky-nav");
      }
    });
  };
};

export { showNav }
