//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker/core
//= require_tree .

$(document).ready(function() {
  $('.datepicker').datepicker({
    todayBtn: true,
    clearBtn: true,
    daysOfWeekHighlighted: "5",
    todayHighlight: true
  });
});
