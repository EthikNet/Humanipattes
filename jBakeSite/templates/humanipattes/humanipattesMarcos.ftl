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

<#macro aAdopterSubTemplate theContent>
	<div class="aAdopterSubTemplate">
		<div class="animalBio">
			<div class="animalPhoto">
				<#if (theContent.contentImage)??>
					<@common.addImageIcon theContent.contentImage "animalMainImage"/>
				</#if>
			</div>
			<div class="animalDescription">
				<div class="animalTitle">
					${theContent.title}
				</div>
				${theContent.body}
			</div>
		</div>
		<div class="animalOtherInfos>
			<div class="mainInfos">
				<span class="title">En Résumé</span>
				<ul>
				<#if (theContent.sexe)??>
					<li class="animalSexe">${theContent.sexe}</li>
				</#if>
				<#if (theContent.dateNaissance)??>
					<li class="animalDateNaissance">${theContent.dateNaissance}</li>
				</#if>
				<#if (theContent.bonus)??>
					<li class="animalBonus">${theContent.bonus}</li>
				</#if>
				<#if (theContent.tarif)??>
					<li class="animalTarif">${theContent.tarif}</li>
				</#if>
				</ul>
			</div>
			<div class="animalCaractere">
				<span class="title">Son caractère</span>
				<#if (theContent.caractere)??>
					<ul>
					<li class="animalcaractere">${theContent.caractere}</li>
					</ul>
				</#if>
			</div>
			<div class="animalNow">
				<span class="title">Actuellement</span>
				<#if (theContent.autre)??>
					<ul>
					<li class="animalAutre">${theContent.autre}</li>
					</ul>
				</#if>
			</div>
		</div>
		<div class="animalOtherPhotos">
		</div>
	</div>
</#macro>
