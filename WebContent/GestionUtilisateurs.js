/**
 * 
 */

function cbEditerUtilisateur(){
	var $id = $(this).parent().parent().children().eq(0).text();
	var $login = $(this).parent().parent().children().eq(1).text();
	var $password = $(this).parent().parent().children().eq(2).text();
	var $role = $(this).parent().parent().children().eq(3).text();
	$("#identifiantModal").val($id);
	$("#loginModal").val($login);
	$("#passwordModal").val($password);
	if($role == "USER"){
		$("#roleModalUser").attr("selected", "selected");
	}else if($role == "ADMIN"){
		$("#roleModalAdmin").attr("selected", "selected");
	}
}

function cbSauvegarderModal(){
	
	var $form = $("form");
	$form.attr("method", "post");
	$form.attr("action", "/tpLundi/GestionUtilisateurs");
	$form.append($("input").attr("type", "hidden"));
    
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
        
    

    document.body.appendChild(form);
    form.submit();
}

$(document).ready(
	function(){
		$(".editerUtilisateur").click(cbEditerUtilisateur);
		$("#sauvegarderModal").click(cbSauvegarderModal);
	}
);