<blank>

  <!-- Navigation Bar -->
  <div id="topbar">
    <div class="contain">
      <div class="grid-2_xs-1">
        <div class="col center-sm">
          <span class="menu hidden-lgi">
            <i class="fa fa-bars" onclick={ sidebar }></i>
          </span>
          <span class="page-title">
            { app.name }
          </span>
        </div>
        <div class="col hidden-sm tr">
          <nav>
            <yield from="navigation"/>
          </nav>
        </div>
      </div>
    </div>
  </div>

  <!-- Sidebar -->
  <aside class="hidden-lg" id="sidebar" onclick={ hideSidebar }>
    <yield from="navigation"/>

    <footer>
      <a href="#">{ app.name }</a> v{ app.version }
    </footer>
  </aside>

  <!-- Content  -->
  <div id="pages" onclick={ hideSidebar }>
    <div class="contain">
      <yield from="pages"/>
    </div>
  </div>

  <script>

    var app = {
      name: "blank",
      version: "1.0.0",
      pageTitle: "a blank page.",

      // A suite of dom manipulation tools!
      dom: function(el, data, all) { // Get Element
        if (!el) return { error: "No Element Passed!" };
        if (el.target && !data) return { error: "Missing Data." };
        if (typeof el === "string") {
          if (!all) el = document.querySelector(el);
          else el = document.querySelectorAll(el);
        }
        if (el.target) {
          if (!all) el = document.querySelector(el.target.dataset[data]);
          else el = document.querySelectorAll(el.target.dataset[data]);
        }
        if (el.tagName) return el;
        return { error: "Couldn't find DOM element: " + el };
      },


      domAll: function(el, data) { // Get All Elements
        return this.dom(el, data, true);
      },

      hasClass: function(el, search) {
        if (!el.tagName) el = this.dom(el);
        var rgx = new RegExp('(^| )' + search + '( |$)', 'gi');
        if (el && el.classList) return el.classList.contains(search);
        if (el && el.className) return rgx.test(el.className);
        return false;
      },

      show: function(el) { // adds "active" class)
        if (!el.tagName) el = this.dom(el);
        if (el && el.classList) el.classList.add("active");
        else if (el) el.className += " active";
        return true; // for click-through
      },

      hide: function(el) { // remove "active" class
        if (!el.tagName) el = this.dom(el, "hide");
        if (el && el.classList) el.classList.remove("active");
        else if (el) el.className = el.className.replace("active", " ");
        return true; // for click-through
      },

      hideAll: function(el) {
        var _hide = this.hide;
        el = this.domAll(el, "hide");
        el.forEach(function(element) {
          _hide(element);
        });
      },

      showAll: function(el) {
        var _show = this.show;
        el = this.domAll(el, "show");
        el.forEach(function(element) {
          _show(element);
        });
      },

      toggle: function(el) { // toggle active class
        if (!el.tagName) el = this.dom(el, "toggle");
        if (el && this.hasClass(el, "active")) this.hide(el);
        else if (el) this.show(el);
        return true; // for click-through
      }

    };
    this.app = app;

    this.sidebar = function() {
      app.toggle("#sidebar");
      return true; // for click-through
    };
    this.hideSidebar = function() {
      app.hide("#sidebar");
      return true; // for click-through
    };

    this.on('mount', function() {

      // Read any current hashtags, and switch tabs!
      riot.route.exec();
    });
  </script>

</blank>
