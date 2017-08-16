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


// $(function() {
//   // limits the number of categories
//   $('#personal_references').on('cocoon:after-insert', function() {
//     check_to_hide_or_show_add_link();
//   });
//
//   $('#personal_references').on('cocoon:after-remove', function() {
//     check_to_hide_or_show_add_link();
//   });
//
//   check_to_hide_or_show_add_link();
//
//   function check_to_hide_or_show_add_link() {
//     if ($('#personal_references .nested-fields').length == 5) {
//       $('#add-category a').hide();
//     } else {
//       $('#add-category a').show();
//     }
//   }
// });
