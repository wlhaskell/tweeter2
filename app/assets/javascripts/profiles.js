function hoverIn(){
	console.log("your in!")
	if ($(this).hasClass("btn-primary")){
		$(this).removeClass("btn-primary");
		$(this).addClass("btn-success");
	} else {
		$(this).removeClass("btn-info");
		$(this).addClass("btn-danger");
		$(this).html("Unfollow");
	}
}

function hoverOut(){
	console.log("your out!")
	if ($(this).hasClass("btn-success")){
		$(this).removeClass("btn-success");
		$(this).addClass("btn-primary");
	} else {
		$(this).removeClass("btn-danger");
		$(this).addClass("btn-info");
		$(this).html("Following");
	}
}	



$(document).ready(function(){
	$(".follow_button").hover( hoverIn,hoverOut );
});