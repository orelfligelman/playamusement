$(function() {
    $( "#datepicker" ).datepicker();
    $('#calendar').fullCalendar({
        googleCalendarApiKey: '<YOUR API KEY>',
        events: {
            googleCalendarId: '754qcnsp17sgll46iduflhbem0@group.calendar.google.com'
        	}
    	});
	});
});
