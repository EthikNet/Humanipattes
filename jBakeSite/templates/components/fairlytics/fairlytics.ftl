<#function getComponnentInfo>
	<#return {"componnentVersion":2, "name":"fairlytics", "description":"track user activity on website", "recommandedNamespace":"fairlytics", "version":"0.1.0", "require":[{"value":"propertiesHelper", "type":"lib"}, {"value":"component.fairlytics.key", "type":"config"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#function registerDefaultHooks()>
	<#local registerComponnentHooks = true>
	<#if registerComponnentHooks>
		${hookHelper.registerHook("afterFooter", "fairlytics.build", false)}
	</#if>
</#function>

<#function addHeaderScripts()>
	<#return "" />
</#function>

<#function addFooterScripts()>
	<#return "" />
</#function>

<#-- build a form
param : content : content to search for form data
-->
<#macro build content>
	<#local keyConfig = "component.fairlytics.key">
	<#local fairlyticsScript="">
	<#if (propertiesHelper)?? && (propertiesHelper.hasConfigValue(keyConfig))??>
		<#local failyticsKey=propertiesHelper.retrieveAndDisplayConfigText(keyConfig)>
		<#if failyticsKey?has_content>
			${"<script defer id=\"fairlytics-id-ajcu6jd9k7ysd6\" data-fairlyticskey=\""+failyticsKey+"\" src=\"https://app.fairlytics.tech/tag/tag.js\"></script>"}
		</#if>
	</#if>
</#macro>