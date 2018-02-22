//= require jquery
//= require rails-ujs
//= require bootstrap-datepicker
//= require_tree .

$('#booking_booking_date').datepicker({
    format: "dd/mm/yy",
    weekStart: 1,
    daysOfWeekDisabled: "0,6"
});
