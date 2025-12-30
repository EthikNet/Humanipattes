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
<#-- sdk.js -->
	<#local scriptName="debug.js">
	<#if (content.useFacebook)?? && content.useFacebook  == "true">
		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/fr_FR/sdk/${scriptName}#xfbml=1&version=v24.0&appId=${webleger.component.meta.dev.key}"></script>
	</#if>
</#macro>

<#macro buildNews content>
	<div class="faceBookContainer">
    	<div class="fb-page" 
    		data-href="${webleger.component.meta.facebook.container.url}" 
    		data-tabs="timeline" 
    		data-width="${webleger.component.meta.facebook.container.width.mobile}" 
    		data-height="${webleger.component.meta.facebook.container.height.mobile}" 
    		data-small-header="true" 
    		data-adapt-container-width="true" 
    		data-hide-cover="false" 
    		data-show-facepile="true">
    			<blockquote cite="https://www.facebook.com/HumaniPattes/" 
    				class="fb-xfbml-parse-ignore">
    					<a href="https://www.facebook.com/HumaniPattes/">${webleger.component.meta.facebook.container.name}</a>
    			</blockquote>
    	</div>
	</div>
</#macro>