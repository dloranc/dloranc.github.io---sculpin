'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');
var gutil = require('gulp-util');
var watch = require('gulp-watch');
var del = require('del');

gulp.task('sass', function () {
    gulp.src('./scss/**/*.scss')
        .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
        .pipe(gulp.dest('./source/css'));
});

watch('scss/**/*.scss', function() {
    gulp.start('sass');
});

gulp.task('clean', function(cb) {
    del(['./source/css/**'], cb);
});

gulp.task('default', function() {
    gulp.start('clean');
});
