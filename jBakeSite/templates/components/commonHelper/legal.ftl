<#function getComponnentInfo>
	<#return {"componnentVersion":1, "name":"legal", "description":"help for legal informations", "recommandedNamespace":"legal", "version":"0.1.0", "uses":[{"value":"propertiesHelper", "type":"lib"}, {"value":"logHelper", "type":"lib"}]}>
</#function>

<#function init>
	<#return "" />
</#function>

<#macro buildLegal theContent cssClass="legal">
	<#if isEnableLegal() && (theContent.legalPage)?? && theContent.legalPage=="true">
		<div<#if (cssClass)??> class="${cssClass}</#if>">
			<div class="legal_identity">
				<h3>Identitée</h3>
				<@displayPropsIfSet "site.legal.identity.name"/>
				<@displayPropsIfSet "site.legal.identity.status"/>
				<@displayPropsIfSet "site.legal.identity.capital_stock"/>
			</div>
			<div class="legal_contact">
				<h3>Contact</h3>
				<@displayPropsIfSet "site.legal.contact.postal_address"/>
				<@displayPropsIfSet "site.legal.contact.email"/>
				<@displayPropsIfSet "site.legal.contact.phone_number"/>
			</div>
			<div class="legal_hosting">
				<h3>Hébergeur</h3>
				<@displayPropsIfSet "site.legal.hosting.name"/>
				<@displayPropsIfSet "site.legal.hosting.company.name"/>
				<@displayPropsIfSet "site.legal.hosting.company.address"/>
				<@displayPropsIfSet "site.legal.hosting.company.phone_number"/>
			</div>
			<div class="legal_specific">
				<h3>Autres informations</h3>
				<@displayPropsIfSet "site.legal.identification1.code" "site.legal.identification1.type"/>
				<@displayPropsIfSet "site.legal.identification2.code" "site.legal.identification2.type"/>
				<@displayPropsIfSet "site.legal.identification3.code" "site.legal.identification3.type"/>
				<@displayPropsIfSet "site.legal.identification4.code" "site.legal.identification4.type"/>
				<@displayPropsIfSet "site.legal.identification5.code" "site.legal.identification5.type"/>
			</div>
			<div class="legal_inforlational">
				<@displayPropsIfSet "site.legal.information.name" "site.legal.information.type"/>
			</div>
			<div class="legal_permission">
				<@displayPropsIfSet "site.legal.specific.permission.authority.name"/>
				<@displayPropsIfSet "site.legal.specific.permission.authority.address"/>
			</div>
			<div class="legal_regulated">
				<@displayPropsIfSet "site.legal.specific.regulated_activities.rules"/>
				<@displayPropsIfSet "site.legal.specific.regulated_activities.profesionnal_title"/>
				<@displayPropsIfSet "site.legal.specific.regulated_activities.allowed_contries"/>
				<@displayPropsIfSet "site.legal.specific.regulated_activities.professional_order.name"/>
			</div>
		</div>
	</#if>
</#macro>

<#function isEnableLegal>
	<#local isLegalEnable = (propertiesHelper.retrieveAndDisplayConfigText("site.legal.enable"))?? 
			&& propertiesHelper.retrieveAndDisplayConfigText("site.legal.enable")=="true">
	<#if logHelper??>
		${logHelper.stackDebugMessage("legal.isEnableLegal : global enable value : " + isLegalEnable?string("true", "no"))}
	</#if>
	<#return isLegalEnable/>
</#function>

<#function isLegalContent theContent>
	<#return (theContent.legalPage)?? && theContent.legalPage=="true"/>
</#function>

<#macro displayLegaleLinks theContent classes="legal_menu">
	<#local allLegalContents = db.getPublishedContent("org_openCiLife_post")?filter(ct -> (isLegalContent(ct)))>
	<#if (allLegalContents?size>0)>
		<ul class="${classes}">
			<#list allLegalContents?sort_by("date") as legalContent>
				<li><a href=${legalContent.uri}>${legalContent.title}</a></li>
			</#list>
		</ul>
	</#if>
</#macro>

<#macro buildCGV theContent>
	<#local cssClass="cgv">
	<#if (theContent.cgv)?? && theContent.cgv=="true">
		<div<#if (cssClass)??> class="${cssClass}</#if>">
			<div class="cgv_current">
					//TODO
			</div>
			<div class="cgv_old">
					//TODO
			</div>
		</div>
	</#if>
</#macro>

<#macro displayPropsIfSet property label="__PROPS__" htmlTag="div">
	<#if propertiesHelper.hasConfigValue(property)>
		<#local theLabel = "">
		<#if label=="__PROPS__">
			<#local theLabel = property + ".label">
		<#else>
			<#local theLabel = label>
		</#if>
		<#local theLabel=propertiesHelper.retrieveAndDisplayConfigText(theLabel, true, ",")>
		<#local value=propertiesHelper.retrieveAndDisplayConfigText(property, true, ",")>
		<#if value?has_content>
			<${htmlTag}><span class="label">${theLabel}</span>: ${value}</${htmlTag}>
		</#if>
	</#if>
</#macro>
