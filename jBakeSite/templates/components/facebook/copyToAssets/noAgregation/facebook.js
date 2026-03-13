$(document).ready(function() {
	
 WindowWidth = $(window).width();
if (WindowWidth < 640){
	$(".faceBookContainer").attr("width", "${webleger.component.meta.facebook.container.width.mobile}")
	$(".faceBookContainer").attr("height", "${webleger.component.meta.facebook.container.height.mobile}")
	$(".faceBookContainer .fb-page").attr("data-width", "${webleger.component.meta.facebook.container.width.mobile}")
	$(".faceBookContainer .fb-page").attr("data-height", "${webleger.component.meta.facebook.container.height.mobile}")
}
else {
	$(".faceBookContainer").attr("width", "${webleger.component.meta.facebook.container.width.desktop}")
	$(".faceBookContainer").attr("height", "${webleger.component.meta.facebook.container.height.desktop}")
	$(".faceBookContainer .fb-page").attr("data-width", "${webleger.component.meta.facebook.container.width.desktop}")
	$(".faceBookContainer .fb-page").attr("data-height", "${webleger.component.meta.facebook.container.height.desktop}")
}
   
  $.ajaxSetup({ cache: true });
  $.getScript('https://connect.facebook.net/fr_FR/sdk.js', function(){
    FB.init({
      appId: '${webleger.component.meta.dev.key}',
      version: '${webleger.component.meta.dev.sdk.version}',
      xfbml : true,
      localStorage : false
    });
  });
});