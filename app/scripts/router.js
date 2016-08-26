// Router!

// Start the router
riot.route.start();

// Define the "router" (tab switcher, lol)
riot.route(function(target) {
  if (!target) target = "home";
  var page = document.querySelector("#pages section#" + target),
    links = document.querySelectorAll("a[href='#" + target + "']");
  if (page && links) {
    var oldPage = document.querySelector("#pages section.active"),
      oldLinks = document.querySelectorAll("a.active");
    if (oldPage) oldPage.classList.remove("active");
    if (oldLinks) {
      oldLinks.forEach(function(link) {
        link.classList.remove("active");
      });
    }
    if (page.classList) page.classList.add("active");
    else page.className += "active";
    links.forEach(function(link) {
      if (link.classList) link.classList.add("active");
      else link.className += "active";
    });
  }
});

// route is exec'd in main app tag
