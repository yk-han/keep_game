// Form Submit
function lib_html_elements_submit(){	
	$("#gmID10000").find("[type='submit']").trigger("click");	
}

// Form clear
function lib_html_elements_clear(){	
	if ( $("#gmID10000").length > 0 ){
		$("#gmID10000").children().remove();
	}
}

// Form Hide
function lib_html_elements_hide(){
	if ( $("form.frm").length > 0 ){
		$("form.frm").get(0).reset();
		$("form.frm").find("input").hide();		
	}
}

// Form Show
function lib_html_elements_show(){
	if ( $("form.frm").length > 0 ){
		$("form.frm").find("input").show();		
	}
}