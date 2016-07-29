<topbar>
  <!-- Top Bar, for small things -->
  <div class="upper container bg-red-dark">
    <div class="row" id="topDrawer">
      <div class="col-xs-12">
        <yield />
      </div>
    </div>
  </div>

  <!-- Main Bar, for title/buttons -->
  <div class="lower container bg-red" data-toggle="#topDrawer">
    <div class="row">
      <div class="col-xs-12">
        <h4 class="up">
          <span id="menu">
            <i class="fa fa-bars c-white"></i>
          </span>
          { opts.pageTitle }
        </h4>
      </div>
    </div>
  </div>

  <style>
    topbar {
      width: 100%;
    }
    .upper {
      padding: .25rem 1rem;
    }
    .lower {
      padding: .5rem 1rem;
    }
    h4 {
      margin: 0;
      padding: 0;
      font-size: 1em;
    }
    #menu {
      margin-right: .5rem;
      display: inline-block;
    }
    #topDrawer {
      display: none;
      padding: .5rem 0;
    }
    #topDrawer.active {
      display: block;
    }
  </style>
</topbar>
