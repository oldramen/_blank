<blank>
  <!-- Navigation Bar -->
  <div id="topbar">
    <div class="upper"></div>
    <div class="main contain">
      <div class="row">
        <div class="col-xs">
          <span class="menu" onclick={ sidebar }><i class="fa fa-bars"></i></span>
          <span class="title">{ pageTitle }</span>
        </div>
      </div>
    </div>
  </div>

  <aside id="sidebar" onclick={ sidebar }>
    <nav id="nav">
      <yield from="navigation" />
    </nav>
  </aside>

  <div id="pages" onclick={ sidebar }>
    <yield from="pages" />

    <!-- Global Footer for all pages -->
    <footer>
      { appName } v{ appVersion }
      <yield from="footer" />
    </footer>
  </div>

  <style>
    blank {
      width: 100%;
    }
  </style>

  <script>
    this.appName = "blank";
    this.pageTitle = "Blank App.";
    this.appVersion = "0.1";

    // app tools
    this.getDom = function(el, data) {
      // quick function to get an element from, well, anything
      if (el) {
        if (typeof el === "string") {
          el = document.querySelector(el);
        } else if (el.target) {
          el = document.querySelector(el.target.dataset[data]);
        }
      }
      if (el && el.tagName) return el;
      return false;
    };

    this.getAll = function(el, data) {
      // same as above, but all instances
      if (typeof el === "string") el = document.querySelectorAll(el);
      if (el.target) el = document.querySelectorAll(el.target.dataset[data]);
      if (el[0] && el[0].tagName) return el;
      return [];
    };

    this.hasClass = function(el, search) {
      el = this.getDom(el);
      var rgx = new RegExp('(^| )' + search + '( |$)', 'gi');
      if (el && el.classList) return el.classList.contains(search);
      if (el && el.className) return rgx.test(el.className);
      return false;
    };

    this.show = function(el) {
      // add "active" class
      el = this.getDom(el, "show");
      if (el && el.classList) el.classList.add("active");
      else if (el) el.className += " active";
      return true; // for click-through
    };

    this.hide = function(el) {
      // remove "active" class
      el = this.getDom(el, "hide");
      if (el && el.classList) el.classList.remove("active");
      else if (el) el.className = el.className.replace("active", " ");
      return true; // for click-through
    };

    this.hideAll = function(el) {
      el = this.getAll(el, "hide");
      el.forEach(function(item) {
        this.hide(item);
      });
    };

    this.showAll = function(el) {
      el = this.getAll(el, "show");
      el.forEach(function(item) {
        this.show(item);
      });
    };

    this.toggle = function(el) {
      // toggle active class
      el = this.getDom(el, "toggle");
      if (el && this.hasClass(el, "active")) this.hide(el);
      else if (el) this.show(el);
      return true; // for click-through
    };

    // app functions
    this.sidebar = function() {
      this.toggle("#sidebar");
    };

    this.on('mount', function() {

      // Read any current hashtags, and switch tabs!
      riot.route.exec();
    });
  </script>

</blank>
