<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<c:if test="${sessionScope.isUser == false}">
		<form action="" method="post">
			<!-- tpLundi/AuthControlle -->


			<span>Login</span> <input id="input-type-text" type="text"
				name="login"> <input id="input-type-password"
				type="password" name="password">
			<button type="submit">Entrer</button>


		</form>
	</c:if>

	<c:if test="${sessionScope.isAdmin == true}">

		<c:out value="Bienvenu, t'as le droit de Admin"></c:out>

		<a href="http://localhost:8080/tpLundi/GestionUtilisateur">Gestion
			Utilisateur</a>

	</c:if>



	<c:if test="${sessionScope.isUser == true}">

		<c:out value="Bienvenu, t'as le droit de User"></c:out>

		<a href="http://localhost:8080/tpLundi/GestionProduits">Gestion
			Produits</a>
		<a href="http://localhost:8080/tpLundi/Accueil">Deconnect</a>

	</c:if>
