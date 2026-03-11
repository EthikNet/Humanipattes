<#function getComponnentInfo>
	<#return {"componnentVersion":2, "name":"langHelper", "description":"Helper for multi-language", "recommandedNamespace":"langHelper", "version":"0.2.0", "require":[{"value":"sequenceHelper", "type":"lib"}, {"value":"propertiesHelper", "type":"lib"}, {"value":"lang", "type":"contentHeader"}, {"value":"languageSwitcher", "type":"contentHeader"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#function registerDefaultHooks()>
	<#local registerComponnentHooks = true>
	<#if registerComponnentHooks>
		${hookHelper.registerHook("afterBlockBody", "langHelper.build", false)}
	</#if>
</#function>

<#function addHeaderScripts()>
	<#return "" />
</#function>

<#function addFooterScripts()>
	<#return "" />
</#function>

<#-- get the language of the content
    @param content The content.
-->
<#function getLang content>
	<#local contentLang = "fr-FR">
	
	<#if (config.site_langs_default)??>
		<#local contentLang = config.site_langs_default>
	</#if>
	
	<#if (content)?? && (content.lang)??>
		<#local contentLang = content.lang>
	</#if>
	
	<#return contentLang>
</#function>

<#-- get the language of the content, return lang as ISO 3166-1 alpha-2
    @param content The content.
-->
<#function getLangForHtmlHeader content>
	<#local contentLang = getLang(content)>
	<#local htmlHeaderLang = contentLang>

	<#if (htmlHeaderLang?length > 2) && htmlHeaderLang?contains("_")>
		<#local htmlHeaderLang = htmlHeaderLang?keep_before("_")>
	</#if>
	<#if (htmlHeaderLang?length > 2) && htmlHeaderLang?contains("-")>
		<#local htmlHeaderLang = htmlHeaderLang?keep_before("-")>
	</#if>
	<#return htmlHeaderLang>
</#function>

<#-- Determine if content has the correct lang
    @param content The content.
-->
<#function isCorectLang content lang>
	<#local isCorectLang = sequenceHelper.seq_containsOne(lang getLang(content))>
	<#return isCorectLang>
</#function>

<#-- build the language siwthcer menu -->
<#macro build content>
	<#if (content)?? && (content.languageSwitcher)?? && content.languageSwitcher = "true">
	
		<#if !(config.site_langs)??>
			<@debug "langHelper.build : Error missing 'config.langs' config value" />
		<#else>
			<#local jsonContent = propertiesHelper.parseJsonProperty(config.site_langs)>
			<#if !(jsonContent.data)??>
				<#if logHelper??>
					${logHelper.stackDebugMessage("langHelper.build : Error missing 'data' attribute after JSON parsing of attribute ==> " + propertiesHelper.displayParseJsonError(jsonContent))}
				</#if>
			<#else>
				<ul class="languageSwitcher">
				<#list jsonContent.data as languageData>
					<#local isCurrentLang = (languageData.local == getLang(content))>
					<li>
					<#if (languageData.icon)??>
						<img src="${common.buildRootPathAwareURL(languageData.icon)}">
					</#if>
					<#local languageFolder = "">
					<#if (languageData.folder)?? && (languageData.folder?has_content)>
						<#local languageFolder = "/"+languageData.folder>
					</#if>
					<span><a class="language" href="${config.site_host}${languageFolder}/index.html"><#escape x as x?xml>${languageData.title}</#escape></a></span>
					</li>
				</#list>
				</ul>
			</#if>
		</#if>
	<#else>
		<#if logHelper??>
			<@logHelper.debug "No languageSwitcher for this content"/>
		</#if>
	</#if>
</#macro>