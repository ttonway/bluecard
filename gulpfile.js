var gulp = require('gulp');
var concat = require('gulp-concat');
var concatVendor = require('gulp-concat-vendor');
var uglify = require('gulp-uglify');
var minifycss = require('gulp-minify-css');
var sourcemaps = require('gulp-sourcemaps');
var inject = require('gulp-inject');
var gzip = require('gulp-gzip');
var clone = require('gulp-clone');
var rev = require('gulp-rev');
var revreplace = require('gulp-rev-replace');
var include = require("gulp-include");

var del = require('del');
var series = require('stream-series');


var staticSrc = 'src/main';
var staticDst = 'src/main/webapp/static';
var jspSrc = 'src/main/jsp';
var jspDst = 'src/main/webapp/views';


gulp.task('clean', function () {
    return del(['rev-manifest.json',
        staticDst + '/css',
        staticDst + '/js',
        staticDst + '/images',
        jspDst])
        .then(function (paths) {
            console.log('Deleted files and folders:\n', paths.join('\n'));
        });
});

gulp.task('styles', ['clean'], function () {
    return gulp.src(staticSrc + '/css/**/*.css', {base: staticSrc})
        // .pipe(sourcemaps.init())
        .pipe(minifycss())
        .pipe(rev())
        // .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(staticDst))
        .pipe(rev.manifest())
        .pipe(gulp.dest(''));
});
gulp.task('scripts', ['styles'], function () {

    return gulp.src(staticSrc + '/js/**/*.js', {base: staticSrc})
        // .pipe(sourcemaps.init())
        .pipe(include({
            hardFail: true,
            includePaths: [staticDst + "/lib"]
        })).on('error', console.log)
        .pipe(uglify())
        .pipe(rev())
        // .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(staticDst))
        .pipe(rev.manifest({base: '', merge: true}))
        .pipe(gulp.dest(''));
});
gulp.task('copyImages', function () {
    gulp.src(staticSrc + '/images/**/*', {base: staticSrc})
        .pipe(gulp.dest(staticDst));
});

gulp.task("jsp-build", ['styles', 'scripts', 'copyImages'], function () {
    var manifest = gulp.src("rev-manifest.json");
    return gulp.src(jspSrc + "/**/*.jsp", {base: jspSrc})
        .pipe(revreplace({replaceInExtensions: ['.jsp'], manifest: manifest}))
        .pipe(gulp.dest(jspDst));
});

// Default Task
gulp.task('default', ['jsp-build'], function () {

});