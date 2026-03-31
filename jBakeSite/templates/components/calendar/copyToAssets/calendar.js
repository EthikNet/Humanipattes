$(document).ready(function() {
	
	WindowWidth = $(window).width();
	if (WindowWidth < 640){
		$(".calendarFrame").attr("width", "${webleger.component.calendar.container.width.mobile}")
		$(".calendarFrame").attr("height", "${webleger.component.calendar.container.height.mobile}")
	}
	else {
		$(".calendarFrame").attr("width", "${webleger.component.calendar.container.width.desktop}")
		$(".calendarFrame").attr("height", "${webleger.component.calendar.container.height.desktop}")
	}
});