
$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: '',
        events: {
            googleCalendarId: '754qcnsp17sgll46iduflhbem0@group.calendar.google.com'
        }
    });
});

$(function() {
    $( "#datepicker" ).datepicker();
 });
