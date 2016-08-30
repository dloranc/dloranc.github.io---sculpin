'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');
var gutil = require('gulp-util');
var del = require('del');

gulp.task('sass', function () {
    gulp.src('./scss/**/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(gulp.dest('./source/css'));
});

gulp.task('scss:watch', function () {
    gulp.watch('./scss/**/*.scss', ['sass']);
});

gulp.task('clean', function(cb) {
    del(['.source/css/**'], cb);
});

gulp.task('default', function() {
    gulp.start('clean');
    gulp.start('scss:watch');
});
