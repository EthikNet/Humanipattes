$(document).ready(function() {
	// Load Facebook SDK
    if (!window.FB) {
      var script = document.createElement("script");
      //script.src = "https://connect.facebook.net/fr_FR/sdk.js";
      script.src = "https://connect.facebook.net/fr_FR/sdk/debug.js";
      script.async = true;
      script.defer = true;
      script.crossOrigin = "anonymous";
      document.body.appendChild(script);
      console.log("FaceBook loaded");
    } else {
		FB.init({
	  appId      : '123456',
	  status     : false,
	  xfbml      : true,
	  version    : 'v18' // or v2.6, v2.5, v2.4, v2.3
	});
		
	  console.log("FaceBook parsing.....");
      window.FB.XFBML.parse();
      console.log("FaceBook have parsed.");
    }
});


function FB_parse() {
  console.log("FaceBook parsing.....");
	window.FB.XFBML.parse();
	console.log("FaceBook have parsed.");
}