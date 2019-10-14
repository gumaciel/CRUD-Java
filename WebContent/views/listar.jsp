
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<c:if test="${empty sessionScope['usuario']}">
		<c:set var="msgAviso" value="Você precisa entrar no sistema para ter acesso a esse conteúdo" scope="session" />
		<c:redirect url="index.jsp" />
	</c:if>
	
	<meta charset="UTF-8">
	<title>Listar Usuarios</title>
</head>
<body>
<div class="container">
	<table class="orange lighten-4">
		<tr>
			<td>
				<font size="3">
					Bem vindo <c:out value="${sessionScope.usuario.nome}"/>, deseja fazer <a href="logout">Logout?</a>
				</font>
			</td>
		</tr>
	</table>
	
	<h1>Listar Usuarios</h1>
	
	<table border="1" class="striped">
		<tr>
			<td>ID, ação:</td>
			<td>Nome: </td>
			<td>Email: </td>
			<td>Senha: </td>
			<td>DDD: </td>
			<td>Número: </td>
			<td>Tipo de Telefone: </td>
			<td>Ação: </td>
		</tr>
		
		<c:forEach var="arrayUsuario" items="${arrayUsuario}" varStatus="loopUsuario">
			<tr>
				<td> <a class="waves-effect waves-light btn" href="usuario?opcao=meditar&id_usuario=<c:out value="${arrayUsuario.id_usuario}"></c:out>"> <c:out value="${arrayUsuario.id_usuario}"></c:out>, Editar </a> </td>
				<td><c:out value="${arrayUsuario.nome}"></c:out></td>
				<td><c:out value="${arrayUsuario.email}"></c:out></td>
				<td><c:out value="${arrayUsuario.senha}"></c:out></td>
				<td><c:forEach var="arrayUsuarioTelefone" items="${arrayUsuarioTelefone[loopUsuario.index]}">
					<c:out value="${arrayUsuarioTelefone.ddd}"></c:out><br>
				</c:forEach></td>
				<td><c:forEach var="arrayUsuarioTelefone" items="${arrayUsuarioTelefone[loopUsuario.index]}">
					<c:out value="${arrayUsuarioTelefone.numero_telefone}"></c:out><br>
				</c:forEach></td>
				<td><c:forEach var="arrayTelefoneTipo" items="${arrayTelefoneTipo[loopUsuario.index]}">
					<c:out value="${arrayTelefoneTipo.nome}"></c:out><br>
				</c:forEach></td>
				<td> <a class="waves-effect waves-light btn" href="usuario?opcao=deletar&id_usuario=<c:out value="${arrayUsuario.id_usuario}"></c:out>"> Deletar </a> </td>
			</tr>
		</c:forEach>
		<tr>
			<td class="left-align">
				<a class="waves-effect waves-light btn" href= "usuario?opcao=voltar&view=principal.jsp"><i class="material-icons right">arrow_back</i>Voltar</a>
			</td>
		</tr>
		
	</table>
</div>
</body>
</html>