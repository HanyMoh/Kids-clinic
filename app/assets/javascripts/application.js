//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker/core
//= require_tree .

$(document).ready(function() {
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
