<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty sessionScope['usuario']}">
	<c:set var="msgAviso" value="Você precisa entrar no sistema para ter acesso a esse conteúdo" scope="session" />
	<c:redirect url="index.jsp" />
</c:if>

<meta charset="UTF-8">
<title>Usuários</title>
</head>
<body>
 <table>
 	<tr>
 		<td>
 			Bem vindo <c:out value="${sessionScope.usuario.nome}"/>, deseja fazer <a href="logout">Logout?</a>
 		</td>
 	</tr>
 </table>

<h1>Gerenciamento de Usuários </h1>

<table border="1">
	<tr>
		<td> <a href= "usuario?opcao=criar">Registrar um Usuário</a></td>
	</tr>
	<tr>
		<td> <a href= "usuario?opcao=listar">Listar todos os Usuários</a></td>
	</tr>

</table>
<font color="red">
	<c:out value="${sessionScope.msgAviso}"/>
</font>

<c:set var="msgAviso" value="" scope="session" />	


</body>
</html>