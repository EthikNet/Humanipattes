<#function getComponnentInfo>
	<#return {"componnentVersion":1, "name":"facebook", "description":"To integrate FaceBook in website", "recommandedNamespace":"facebook", "version":"0.1.0", "require":[{"value":"propertiesHelper", "type":"lib"}, {"value":"component.fairlytics.key", "type":"config"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#-- build a form
param : content : content to search for form data
-->
<#macro addFaceBookScript content>
	<#-- <script async defer crossorigin="anonymous" src="https://connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v18.0"></script> -->
	
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk/debug.js#xfbml=1&version=v18.0"></script>
</#macro>

<#macro buildNews content>
	<div class="faceBookNews">
	    <div
	      class="fb-page"
	      className="fb-page"
	      data-href="https://www.facebook.com/HumaniPattes/"
	      data-tabs="timeline"
	      data-width="500"
	      data-height="600"
	      data-small-header="false"
	      data-adapt-container-width="true"
	      data-hide-cover="false"
	      data-show-facepile="true"
	    >
	      <blockquote
	        cite="https://www.facebook.com/HumaniPattes/"
	        className="fb-xfbml-parse-ignore"
	      >
	        <a href="https://www.facebook.com/HumaniPattes/">
	          Chargement de la page Facebook...
	        </a>
	  </blockquote>
	  </div>
	  <br/>
        <button onclick="FB_parse();">forcer l'affichage</button>
</#macro>