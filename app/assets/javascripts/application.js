//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker/core
//= require Chart.bundle
//= require chartkick
//= require select2
//= require cocoon
//= require app
//= require_tree .

$(document).ready(function() {
  $('select.select2').select2();
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

  $('.fa-print').parent().click(function (e) {
      e.preventDefault();
      var element = $('.box-print');
      var res = $('.wrapper').html();
      element.find('.pTable-0').prepend($('.box-title').text());
      element.find('.no-print').remove();
      element.find('a').removeAttr('href').css('text-decoration', 'none');
      var content = element.html();
      $('.wrapper').html(content);
      window.print();
      $('.wrapper').html(res);
      location.reload();
  });
});
