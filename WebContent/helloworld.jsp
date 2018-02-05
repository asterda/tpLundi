<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello World</title>
</head>
<body>
<p>
<c:out value="Hello, brave new world !"></c:out>
</p>
<ul>
<c:forEach items="${produits}" var="produit">
<li>${produit.nom}</li>
</c:forEach>
</ul>
<jsp:include page="menu.jsp"></jsp:include>
</body>
</html>