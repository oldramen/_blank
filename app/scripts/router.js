// Router!

// Start the router
riot.route.start();

// Define the "router" (tab switcher, lol)
riot.route(function(target) {
  if (!target) target = "blankPage";
  var page = document.querySelector("#pages > section#" + target),
    link = document.querySelector("#nav a[href='#" + target + "']");
  if (page && link) {
    var title = link.getAttribute("data-title"),
      oldPage = document.querySelector("#pages > section.active"),
      oldLink = document.querySelector("#nav a.active");
    if (title) document.querySelector('#topbar .title').innerHTML  = title;
    if (oldPage) oldPage.classList.remove("active");
    if (oldLink) oldLink.classList.remove("active");
    if (page.classList) page.classList.add("active");
    else page.className += "active";
    if (link.classList) link.classList.add("active");
    else link.className += "active";
  }
});

// route is exec'd in main app tag
