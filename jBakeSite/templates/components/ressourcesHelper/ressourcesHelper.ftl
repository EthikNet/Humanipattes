<#function getComponnentInfo>
	<#return {"componnentVersion":1, "name":"ressourcesHelper", "description":"Help manage required HTML ressources like CSS and JS", "recommandedNamespace":"ressourcesHelper", "version":"0.1.0", "require":[{"value":"commonHelper", "type":"lib"}], "uses":[{"value":"logHelper", "type":"lib"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#assign headerRessources = []>
<#assign footerRessources = []>

<#macro buildExternalInjectionHeader content>
	<@buildExternalInjection content />
	
	<#if logHelper??>
		${logHelper.stackDebugMessage("ressourcesHelper.buildExternalInjectionHeader : adding " + headerRessources?size + " header ressources form components")}
	</#if>
	<#list headerRessources?sort_by("order") as injection>
		<@buildAnInjection injection/>
	</#list>
</#macro>

<#macro buildExternalInjectionFooter content>
	<@buildExternalInjection content />
	
	<#if logHelper??>
		${logHelper.stackDebugMessage("ressourcesHelper.buildExternalInjectionFooter : adding " + footerRessources?size + " footer ressources form components")}
	</#if>
	<#list footerRessources?sort_by("order") as injection>
		<@buildAnInjection injection/>
	</#list>
</#macro>

<#-- To create "link" header line or footer scripts injection.
param : content : JSON content describing inclusions.
-->
<#macro buildExternalInjection content>
	<#if (content)??>
		<#local jsonContent = propertiesHelper.parseJsonProperty(content)>
		
		<#if !(jsonContent.data)??>
			<#if logHelper??>
				${logHelper.stackDebugMessage("buildExternalInjection : Error missing 'data' attribute after JSON parsing of attribute ==> " + propertiesHelper.displayParseJsonError(jsonContent))}
			</#if>
		<#else>
			<#list jsonContent.data as injection>
				<@buildAnInjection injection/>
			</#list>
		</#if>
	</#if>
</#macro>

<#macro buildAnInjection injection>
	<#assign tagType = injection.tagType!"link">
	<#if ((injection.constraint)??)>
		<!--[${injection.constraint}]>
	</#if>
	<${tagType}<#if (injection.href??)> href="${common.buildRootPathAwareURL(injection.href)}"</#if><#if (injection.src??)> src="${common.buildRootPathAwareURL(injection.src)}"</#if><#if (injection.rel??)> rel="${injection.rel}"</#if>><#if (injection.tagType=="script")></script></#if>
	<#if ((injection.constraint)??)>
		<![endif]-->
	</#if>
</#macro>

<#function addHeaderRessource jsonData>
	<#assign headerRessources = headerRessources + [jsonData]>
	<#return "">
</#function>

<#function addFooterRessource jsonData>
	<#assign footerRessources = footerRessources + [jsonData]>
	<#return "">
</#function>
