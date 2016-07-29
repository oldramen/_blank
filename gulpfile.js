var gulp = require('gulp'),
  elixir = require('laravel-elixir'),
  riot = require('gulp-riot'),
  bower = './bower_components/',
  sass = './app/sass/',
  scripts = './app/scripts/',
  tags = './app/tags/*.tag';
elixir.config.sourcemaps = false;

// define compiler
gulp.task('compile', function() {
  gulp.src(tags)
    .pipe(riot())
    .pipe(gulp.dest('./app/scripts/compiled-tags.js'));
});

elixir(function(mix) {
  mix
    // publish bower assets
    .copy(bower + 'font-awesome/fonts', 'dist/fonts')

    // process sass
    .sass(sass + 'app.scss', './dist/css/app.css')

    // publish views
    .copy('./app/views/*.html', './dist')

    // run compiler
    .task('compile', tags)

    // concat vendor scripts
    .scripts([
      // vendor
      bower + 'riot/riot.min.js',
      bower + 'toggles-switches/toggles-switches.js',
      bower + 'hammerjs/hammer.js',
      // compiled scripts
      scripts + 'compiled-tags.js'
    ], './dist/js/vendor.js')

    // user scripts
    .scripts([
      scripts + 'app.js'
    ], './dist/js/app.js');
});
