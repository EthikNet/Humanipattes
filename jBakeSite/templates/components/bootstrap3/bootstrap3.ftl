<#function getComponnentInfo>
	<#return {"componnentVersion":2, "name":"bootstrap3", "description":"Provide boostrap3 CSS framework", "recommandedNamespace":"boostrap3", "version":"0.1.0"}>
</#function>

<#function init>
	<#return "" />
</#function>

<#function registerDefaultHooks()>
	<#return "">
</#function>

<#function addHeaderScripts()>
	<#if ressourcesHelper??>
		${ressourcesHelper.addHeaderRessource({"tagType":"link", "href":"templates/components/bootstrap3/copyToAssets/noAgregation/html5shiv.min.js", "rel":"stylesheet", "constraint":"if lt IE 9", "order":60})}
	<#else>
		<#if logHelper??>
			${logHelper.stackDebugMessage("boostrap3.addHeaderScripts : ERROR cannot add footer script, missing 'ressourcesHelper' component")}
		</#if>
	</#if>
	<#return "" />
</#function>

<#function addFooterScripts()>
	<#if ressourcesHelper??>
		${ressourcesHelper.addFooterRessource({"tagType":"script", "src":"templates/components/bootstrap3/copyToAssets/noAgregation/jquery-1.11.1.min.js", "order":30})}
		${ressourcesHelper.addFooterRessource({"tagType":"script", "src":"templates/components/bootstrap3/copyToAssets/noAgregation/bootstrap.min.js", "order":35})}
	<#else>
		<#if logHelper??>
			${logHelper.stackDebugMessage("boostrap3.addFooterScripts : ERROR cannot add footer script, missing 'ressourcesHelper' component")}
		</#if>
	</#if>
	<#return "" />
</#function>