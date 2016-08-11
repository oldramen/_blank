riot.tag2('blank', '<div id="topbar"> <div class="upper"></div> <div class="main contain"> <div class="row"> <div class="col-xs"> <span class="menu" onclick="{sidebar}"><i class="fa fa-bars"></i></span> <span class="title">{pageTitle}</span> </div> </div> </div> </div> <aside id="sidebar" onclick="{sidebar}"> <nav id="nav"> <yield from="navigation"></yield> </nav> </aside> <div id="pages" onclick="{sidebar}"> <yield from="pages"></yield> <footer> {appName} v{appVersion} <yield from="footer"></yield> </footer> </div>', 'blank { width: 100%; }', '', function(opts) {
    this.appName = "blank";
    this.pageTitle = "Blank App.";
    this.appVersion = "0.1";

    this.getDom = function(el, data) {

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

      el = this.getDom(el, "show");
      if (el && el.classList) el.classList.add("active");
      else if (el) el.className += " active";
      return true;
    };

    this.hide = function(el) {

      el = this.getDom(el, "hide");
      if (el && el.classList) el.classList.remove("active");
      else if (el) el.className = el.className.replace("active", " ");
      return true;
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

      el = this.getDom(el, "toggle");
      if (el && this.hasClass(el, "active")) this.hide(el);
      else if (el) this.show(el);
      return true;
    };

    this.sidebar = function() {
      this.toggle("#sidebar");
    };

    this.on('mount', function() {

      riot.route.exec();
    });
});

riot.tag2('blankpage', '<h1>Blank!!!</h1>', '', '', function(opts) {
    this.app = this.parent;
});
