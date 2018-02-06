<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="#">Navbar</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="/tpLundi/Accueil">Home</a>
	      </li>
	      <li class="nav-item">
	      	<a href="/tpLundi/GestionProduits" class="nav-link">Produits</a>
	      </li>
	      <li class="nav-item">
	      	<a href="/tpLundi/GestionUtilisateurs" class="nav-link">Administration</a>
	      </li>
	      <c:if test="${sessionScope.isUser == true}">
	      <li class="nav-item">
	      	<a href="/tpLundi/AuthController?action=deconnexion" class="nav-link">Deconnexion</a>
	      </li>
	      </c:if>
	    </ul>
	    <c:if test="${sessionScope.isUser == null}">
	    <form class="form-inline my-2 my-lg-0" action="/tpLundi/AuthController" method="post">
	      <input type="text" name="login" class="form-control mr-sm-2" placeholder="login"/>
	      <input type="password" name="password" class="form-control mr-sm-2" placeholder="password"/>
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Connexion</button>
	    </form>
	    </c:if>
	    <c:if test="${sessionScope.isUser == true}">
	    <span class="form-inline my-2 my-lg-0">
	      Vous êtes connecté.
	    </span>
	    </c:if>

	  </div>
	</nav>
