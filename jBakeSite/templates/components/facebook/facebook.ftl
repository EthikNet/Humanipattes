<#function getComponnentInfo>
	<#return {"componnentVersion":1, "name":"facebook", "description":"To integrate FaceBook in website", "recommandedNamespace":"facebook", "version":"0.2.0", "require":[{"value":"propertiesHelper", "type":"lib"}, {"value":"component.fairlytics.key", "type":"config"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#macro buildNews content>
	<@buildfaceBook "timeline" "${webleger.component.meta.facebook.container.url}"/>
</#macro>

<#macro buildEvent content>
	<@buildfaceBook "events" "${webleger.component.meta.facebook.container.url}/events" />
</#macro>

<#macro buildfaceBook tabs href>
	<div class="faceBookContainer">
    	<div class="fb-page" 
    		data-href="${href}" 
    		data-tabs="${tabs}" 
    		data-width="${webleger.component.meta.facebook.container.width.desktop}" 
    		data-height="${webleger.component.meta.facebook.container.height.desktop}" 
    		data-small-header="false" 
    		data-adapt-container-width="false" 
    		data-hide-cover="false" 
    		data-show-facepile="true">
    			<blockquote cite="${webleger.component.meta.facebook.container.url}" 
    				class="fb-xfbml-parse-ignore">
    					<a href="${webleger.component.meta.facebook.container.url}">${webleger.component.meta.facebook.container.name}</a>
    			</blockquote>
    	</div>
	</div>
</#macro>