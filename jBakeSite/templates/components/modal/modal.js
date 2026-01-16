$('#basicModal').on('show.bs.modal', function (event) {
    console.log ('we are showing a modal');
    
    var triggerElement = $(event.relatedTarget) // Button that triggered the modal
    //var recipient = triggerElement.data('whatever') // Extract info from data-* attributes
    
    var widgetDataPosition = triggerElement.data('content-position');
    if (typeof widgetDataPosition == 'undefined' || widgetDataPosition.length == 0){
		widgetDataPosition = "parent";
	}
	
    var widget = triggerElement.parent();
    if(widgetDataPosition == "inside"){
		widget = triggerElement;
	}
	
	var widgetContentClassPrefix = triggerElement.data('content-class-prefix');
	if (typeof widgetContentClassPrefix == 'undefined' || widgetContentClassPrefix.length == 0){
		widgetContentClassPrefix = "widget";
	}
	
	 console.log ("modal : searching for modal content with CSS class prefix : " + widgetContentClassPrefix + " in : "  + widgetDataPosition);
	
    var bodyContent = widget.find('.'+widgetContentClassPrefix+'_content').html();
    console.log ("modal : body content : " + bodyContent);
    
    var bodyTitle = widget.find('.'+widgetContentClassPrefix+'_title').html();
    console.log ("modal : body title : " + bodyTitle);
    
    var bodyImage = widget.find('.'+widgetContentClassPrefix+'_image');
    console.log ("modal : image SRC attribute : " + bodyImage.attr('src') + ", body Images exists : " + bodyImage.exists());
    
    var moreInfoLink = widget.find('.'+widgetContentClassPrefix+'_moreInfoLink').html();
    console.log ("modal : more info link attribute : " + moreInfoLink);
    
    var tags = widget.find('.'+widgetContentClassPrefix+'_tags').html();
    console.log ("modal : tags attribute : " + tags);
    
    var modal = $(this);
    modal.find('.modal-title').text(bodyTitle);
    modal.find('.modal-body-content').replaceWith('<div class="modal-body-content">' + bodyContent + '</div>');
    if (bodyImage.exists()){
    	modal.find('.modal-image').append('<img src="' + bodyImage.attr('src') + '" class="modal-image" />');
    }
    if (null != moreInfoLink && moreInfoLink.length != 0){
	    modal.find('#modalMoreInfoLink').attr("href", moreInfoLink);
	    modal.find('#modalMoreInfoLink').removeClass("moreInfoHidden)");
    }else{
		modal.find('#modalMoreInfoLink').attr("href", "#");
		if(!modal.find('#modalMoreInfoLink').hasClass("moreInfoHidden")){
		     modal.find('#modalMoreInfoLink').addClass("moreInfoHidden)");
		 }
	}
    
    modal.find('.modal-tags').text(tags);

    modal.attr('aria-inert', false);
 })
 
$('#basicModal').on('hidden.bs.modal', function () {
	console.log ("modal :is hidding");
    var modal = $(this);
    modal.attr('aria-inert', true);
	modal.find('.modal-image').empty();
});