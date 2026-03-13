$(document).ready(function() {
	
 WindowWidth = $(window).width();
if (WindowWidth < 640){
	$(".faceBookContainer").attr("width", "300")
	$(".faceBookContainer").attr("height", "400")
	$(".faceBookContainer .fb-page").attr("data-width", "300")
	$(".faceBookContainer .fb-page").attr("data-height", "400")
}
else {
	$(".faceBookContainer").attr("width", "500")
	$(".faceBookContainer").attr("height", "500")
	$(".faceBookContainer .fb-page").attr("data-width", "500")
	$(".faceBookContainer .fb-page").attr("data-height", "500")
}
   
  $.ajaxSetup({ cache: true });
  $.getScript('https://connect.facebook.net/fr_FR/sdk.js', function(){
    FB.init({
      appId: '866893202588169',
      version: 'v2.7',
      xfbml : true,
      localStorage : false
    });
  });
});