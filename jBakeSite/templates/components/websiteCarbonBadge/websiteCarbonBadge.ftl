<#function getComponnentInfo>
	<#return {"componnentVersion":2, "name":"WebsiteCarbonBadge", "description":"Display an estimation of carbon footprint for pages", "version":"0.1.0", "recommandedNamespace":"websiteCarbonBadge", "require":[{"value":"includeContent", "type":"contentHeader"}], "uses":[{"value":"langHelper", "type":"lib"}, {"value":"logHelper", "type":"lib"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#function registerDefaultHooks()>
	<#local registerComponnentHooks = true>
	<#if registerComponnentHooks>
		${hookHelper.registerHook("afterFooter", "websiteCarbonBadge.build", false)}
	</#if>
</#function>

<#function addHeaderScripts()>
	<#return "" />
</#function>

<#function addFooterScripts()>
	<#if ressourcesHelper??>
		${ressourcesHelper.addFooterRessource({"tagType":"script", "src":"templates/components/websiteCarbonBadge/copyToAssets/noAgregation/website-carbon-badges_1.1.3.js", "order":50})}
	<#else>
		<#if logHelper??>
			${logHelper.stackDebugMessage("WebsiteCarbonBadge.addFooterScripts : ERROR cannot add footer script, missing 'ressourcesHelper' component")}
		</#if>
	</#if>
	<#return "" />
</#function>

<#macro build content>
	<div id="wcb" class="carbonbadge"></div>
</#macro>
