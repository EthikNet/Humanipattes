<#function getComponnentInfo>
	<#return {"componnentVersion":1, "name":"humaniPattes", "description":"humaniPattes Template", "recommandedNamespace":"humaniPattes", "uses":[{"value":"logHelper", "type":"lib"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#macro partenairesCard contentHolder subContents>
	<#local featauredText = "">
	<#local specificContentClass = "">
	<#local specificClass = "">
	<#if (contentHolder??) && (contentHolder.includeContent)??>
		<#if (contentHolder.includeContent.specificClass)??>
			<#local specificClass = contentHolder.includeContent.specificClass>
		</#if>
		<#if (contentHolder.includeContent.display)?? && (contentHolder.includeContent.display.specificClass)?? >
			<#local specificContentClass = contentHolder.includeContent.display.specificClass>
		</#if>
	</#if>
	<div class="card_list ${specificClass}">
		<#list subContents?sort_by("order") as subContent>
			<#local uselessTempVar = commonInc.propagateContentChain(subContent) />
			<#if (subContent.featured)??>
				<#local specificContentClass = specificContentClass + " featured">
				<#if (subContent.featured.text)??>
					<#local featauredText = subContent.featured.text>
				</#if>
			</#if>
			<#if hookHelper??>
				<@hookHelper.hook "beforeItemSubContent" subContent/>
			</#if>
			<div <#if subcontent??><@subcontent.generateAnchor subContent/></#if> class="partenairesCard card ${specificContentClass}">
				<#if featauredText?has_content>
					<div class="featured_label">${featauredText}</div>
				</#if>
				<#if hookHelper??>
					<@hookHelper.hook "beginItemSubContent" subContent/>
				</#if>
				<#if (subContent.tags)?? && (subContent.tags?size > 0) >
					<ul class="subContent_tags">
					<#list subContent.tags as tag>
						<li class="subContent_tag">${tag}</li>
					</#list>
					</ul>
				</#if>
				
				<#if (subContent.contentImage??)>
					<#if (subContent.contentImage)??>
						<@common.addImageIcon subContent.contentImage "partenairesCard_image"/>
					</#if>
				</#if>
				<#if (subContent.exerpt??)>
					<div class="partenairesCard_exerpt">
						${subContent.exerpt!""}
					</div>
				</#if>
				<div class="partenairesCard_content">
					${subContent.body!""}
				</div>
				<#if hookHelper??>
					<@hookHelper.hook "endItemSubContent" subContent/>
				</#if>
			</div>
			<#if hookHelper??>
				<@hookHelper.hook "afterItemSubContent" subContent/>
			</#if>
		</#list>
	</div>
</#macro>
