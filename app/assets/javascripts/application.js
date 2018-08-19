//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker/core
//= require_tree .

$(document).ready(function() {
  $(".submenu > a").click(function(e) {
    e.preventDefault();
    var $li = $(this).parent("li");
    var $ul = $(this).next("ul");

    if ($li.hasClass("open")) {
      $ul.slideUp(350);
      $li.removeClass("open");
    } else {
      $(".nav > li > ul").slideUp(350);
      $(".nav > li").removeClass("open");
      $ul.slideDown(350);
      $li.addClass("open");
    }
  });

  $('.datepicker').datepicker({
    todayBtn: 'linked',
    format: 'yyyy-mm-dd',
    keyboardNavigation: false,
    forceParse: false,
    calendarWeeks: true,
    autoclose: true,
    todayHighlight: true,
  });
});
