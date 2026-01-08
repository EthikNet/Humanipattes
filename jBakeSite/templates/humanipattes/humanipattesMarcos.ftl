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
				<h2 class="animalTitle">
					${theContent.title}
				</h2>
				${theContent.body}
			</div>
		</div>
		<div class="animalOtherInfos primary">
			<div class="mainInfos">
				<h3 class="title">En Résumé</h3>
				<ul>
				<#if (theContent.sexe)??>
					<li class="animalSexe">${theContent.sexe}</li>
				</#if>
				<#if (theContent.dateNaissance)??>
					<li class="animalDateNaissance">${theContent.dateNaissance}</li>
				</#if>
				<#if (theContent.bonus)??>
					<@splitAsLi theContent.bonus "," "animalBonus" />
				</#if>
				<#if (theContent.vigilance)??>
					<@splitAsLi theContent.vigilance "," "animalVigilance" />
				</#if>
				<#if (theContent.aEviter)??>
					<@splitAsLi theContent.aEviter "," "animalAEviter" />
				</#if>
				<#if (theContent.requis)??>
					<@splitAsLi theContent.requis "," "animalRequis" />
				</#if>
				<#if (theContent.tarif)??>
					<li class="animalTarif">${theContent.tarif}</li>
				</#if>
				</ul>
			</div>
			<div class="animalCaractere">
				<h3 class="title">Son caractère</h3>
				<#if (theContent.caractere)??>
					<ul>
						<@splitAsLi theContent.caractere />
					</ul>
				</#if>
			</div>
			<div class="animalNow">
				<h3 class="title">Actuellement</h3>
				<ul>
				<#if (theContent.autre)??>
					<@splitAsLi theContent.autre />
				</#if>
				<#if (theContent.visible)??>
					<li class="animalVisible">${theContent.visible}</li>
				</#if>
				</ul>
			</div>
		</div>
		<div class="animalOtherPhotos">
		</div>
	</div>
	
	<div class="animalPhotos">
		<#if (theContent.imageList)??>
			<#if (theContent.imageList.data)??>
				<#list theContent.imageList.data as fileInfo>
					<img src="${common.buildRootPathAwareURL(fileInfo.file)}"
					<#if (fileInfo.alt)??> alt="${fileInfo.alt}"</#if>
					<#if (fileInfo.width)??> width="${fileInfo.width}"</#if>
					<#if (fileInfo.height)??> height="${fileInfo.height}"</#if>/>
				</#list>
			</#if>
		</#if>
	</div>
</#macro>


<#macro splitAsLi(content, separator=",", specificClass="")>
	<#local splitedItems = content?split(separator)>
	<#list splitedItems as item>
		<#local classAttr = "">
		<#if specificClass??>
			<#local classAttr="class=\""+specificClass+"\"">
		</#if>
		<li ${classAttr}>${item}</li>
	</#list>
</#macro>