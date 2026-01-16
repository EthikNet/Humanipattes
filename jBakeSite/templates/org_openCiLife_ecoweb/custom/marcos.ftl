<#function getComponnentInfo>
	<#return {"componnentVersion":1, "name":"WebLegerMacro", "description":"WebLeger Template", "recommandedNamespace":"ecoWeb", "uses":[{"value":"logHelper", "type":"lib"}, {"value":"displayDate", "type":"contentHeader"}, {"value":"displaySiteHeaderTitle", "type":"contentHeader"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#--  inspired by : https://subscription.packtpub.com/book/web_development/9781782163824/1/ch01lvl1sec06/top-9-features-you-need-to-know-about -->


<#macro displayPublicationDate content>
	<#if ((content.displayDate)?? && content.displayDate == "true")>
		<p>Publié le : <em>${content.date?string("dd MMMM yyyy")}</em></p>
	</#if>
</#macro>

<#macro displayTags content, label="Tags">
	<#if (content.tags)?? && (content.tags?size > 0) >
		<#if (label)?? && (label?has_content)>
			<span>Tags : </span>
		</#if>
		<ul class="content_tags">
		<#list content.tags as tag>
			<li>${tag}</li>
		</#list>
		</ul>
	</#if>
</#macro>

<#function retrieveMetaDescription content>
	<#local desc = propertiesHelper.retrieveAndDisplayConfigText("site.header.description")>
	<#if (content.exerpt)??>
		<#local desc = content.exerpt>
	</#if>
	<#return desc />
</#function>

<#function retrieveMetaKeyWord content>
	<#local keywords = propertiesHelper.retrieveAndDisplayConfigText("site.header.keyword")>
	<#return keywords />
</#function>

<#macro bob block>
	A Basic BOB template !!!!
</#macro>
