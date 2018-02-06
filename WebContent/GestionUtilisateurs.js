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
	
	// Champs modal
	$id = $("#identifiantModal").val();
	$login = $("#loginModal").val();
	$password = $("#passwordModal").val();
	$role = $("#roleModal").val();
	
	// Formulaire caché créé à la volée
	// Nb : erreur initiale création noeud via Jquery : var $form = $("form");
	// -> Jquery allait sélectionner le formulaire d'ajout plutôt que de créer
	// un nouveau noeud formulaire. Idem pour les inputs.
	var $form = $("<form/>");
	$form.attr("method", "post");
	$form.attr("action", "/tpLundi/GestionUtilisateurs");
	$form.append($("<input/>").attr("type", "hidden").attr("name", "id").val($id));
	$form.append($("<input/>").attr("type", "hidden").attr("name", "login").val($login));
	$form.append($("<input/>").attr("type", "hidden").attr("name", "password").val($password));
	$form.append($("<input/>").attr("type", "hidden").attr("name", "role").val($role));
	$form.append($("<input/>").attr("type", "hidden").attr("name", "typeAction").val("edition"));
    $('body').append($form);        
    $form.submit();
    
}

$(document).ready(
	function(){
		$(".editerUtilisateur").click(cbEditerUtilisateur);
		$("#sauvegarderModal").click(cbSauvegarderModal);
	}
);