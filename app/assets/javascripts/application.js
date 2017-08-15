// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
//= require jquery
//= require materialize
//= require materialize-form
//= require cocoon

$(document).ready(function() {
  $('a').mouseenter(function() {
    $(".nav-logo").addClass("no-filter");
    // $(".main_logo").css("color", "#18bc9c");
    // $(".main_logo").removeClass("leave");
  });

  $('a').mouseleave(function() {
    $(".nav-logo").removeClass("no-filter");
    // $(".main_logo").css("color", "white");
    // $(".main_logo").addClass("leave");
  });
});

