<blankapp>
  <!-- Navigation Bar -->
  <div id="topbar">
    <div class="upper"></div>
    <div class="main contain">
      <div class="row">
        <div class="col-xs">
          <span class="menu" data-toggle="#sidebar"><i class="fa fa-bars"></i></span>
          <span class="title">{ pageTitle }</span>
        </div>
      </div>
    </div>
  </div>

  <aside id="sidebar">
    <nav id="nav">
      <yield from="navigation" />
    </nav>
  </aside>

  <div id="pages">
    <yield from="pages" />

    <!-- Global Footer for all pages -->
    <footer>
      { appName } v{ appVersion }
      <yield from="footer" />
    </footer>
  </div>

  <style>
    blankapp {
      width: 100%;
    }
  </style>

  <script>
    this.appName = "blankapp";
    this.pageTitle = "Blank App.";
    this.appVersion = "0.1";

    this.hideBar = function() {
      var sidebar = document.querySelector("#sidebar.active");
      if (sidebar && sidebar.classList) sidebar.classList.remove("active");
    };

    this.on('mount', function() {
      var _ = this,
        nav = document.querySelector("#nav"),
        pages = document.querySelector("#pages");
      // Sidebar Hide!
      nav.onclick = function() { _.hideBar(); };
      pages.onclick = function() { _.hideBar(); };

      // Read any current hashtags, and switch tabs!
      riot.route.exec();
    });
  </script>

</blankapp>
