<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion des utilisateurs</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<jsp:include page="menu.jsp"></jsp:include>

<!-- Liste des utilisateurs -->
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>Id</th>
			<th>Login</th>
			<th>Mot de passe</th>
			<th>Rôle</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
<c:forEach items="${utilisateurs}" var="utilisateur">
	<tr>
		<td>${utilisateur.id}</td>
		<td>${utilisateur.login}</td>
		<td>${utilisateur.motDePasse}</td>
		<td>${utilisateur.role}</td>
		<td><a href="/tpLundi/GestionUtilisateurs?action=del&id=${utilisateur.id}">Supprimer</a></td>
		<td><a href="" class="editerUtilisateur" data-toggle="modal" data-target="#forModal">Editer</a></td>
	</tr>
</c:forEach>
	</tbody>
</table>

<!-- formulaire ajout -->
<h1>Ajouter un utilisateur</h1>
<form action="/tpLundi/GestionUtilisateurs" method="post">
	<div class="form-group">
		<label for="login">Login</label>
		<input class="form-control" type="text" name="login"/>
	</div>
	<div class="form-group">
		<label for="password">Mot de passe</label>
		<input class="form-control" type="password" name="password"/>
	</div>
	<div class="form-group">
		<label for="role">Rôle</label>
		<select class="form-control" name="role">
		  <option value="USER">Utilisateur</option>
		  <option value="ADMIN">Administrateur</option>
		</select>
	</div>
<input type="submit"/>
</form>

<!--  Modal (éditer une ligne) -->
<div class="modal fade" id="forModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabel">Editer l'utilisateur</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalBodyForm">
      	<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">Identifiant</span>
		  </div>
      	  <input type="text" class="form-control" id="identifiantModal" value="" aria-describedby="basic-addon1" disabled/>
      	</div>
 		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon2">Login</span>
		  </div>
          <input type="text" class="form-control" id="loginModal" value="" aria-describedby="basic-addon2"/>
        </div>
      	<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon3">Mot de passe</span>
		  </div>
      	  <input type="text" class="form-control" id="passwordModal" value="" aria-describedby="basic-addon3"/>
      	</div>
      	<div class="input-group mb-3">
      	  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon3">Rôle</span>
		  </div>
		  <select class="form-control" id="roleModal">
		    <option value="USER" id="roleModalUser">Utilisateur</option>
		    <option value="ADMIN" id="roleModalAdmin">Administrateur</option>
		  </select>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        <button type="button" class="btn btn-primary" id="sauvegarderModal" data-dismiss="modal">Sauvegarder</button>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="GestionUtilisateurs.js"></script>
</body>
</html>