<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script> 
<script src="js/validarFormEditarUsuario.js" type="text/javascript"></script>

<c:if test="${empty sessionScope['usuario']}">
	<c:set var="msgAviso" value="Você precisa entrar no sistema para ter acesso a esse conteúdo" scope="session" />
	<c:redirect url="index.jsp" />
</c:if>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Editar Produto</title>
</head>
<body>
 <table>
 	<tr>
 		<td>
 			Bem vindo <c:out value="${sessionScope.usuario.nome}"/>, deseja fazer <a href="logout">Logout?</a>
 		</td>
 	</tr>
 </table>

<h1>Editar Produto</h1>
	<form id="form_usuario" action="usuario" method="post">
	<c:set var="usuario" value="${usuario}"></c:set>
		<input type="hidden" name="opcao" value="editar">
		<input type="hidden" name="id_usuario" value="${usuario.id_usuario}">
		<table border="1">
			<tr>
				<td style="color:red;">Nome:</td>
				<td><input type="text" name="nome" campo-obrigatorio size="50" value="${usuario.nome}"></td>
			</tr>
			<tr>
				<td style="color:red;">Email:</td>
				<td><input type="email" name="email" campo-obrigatorio size="50" value="${usuario.email}"></td>
			</tr>
			<tr>
				<td style="color:red;">Senha:</td>
				<td><input type="password" name="senha" campo-obrigatorio size="50" value="${usuario.senha}"></td>
			</tr>
			<tr>
				<td>Telefone 01:</td>
				<td>
					<select name="id_telefone_tipo01">
						<option value="">
							Selecione...
						</option>
							<c:forEach var="listaTiposTelefone" items="${listaTiposTelefone}">
							<option value="<c:out value="${listaTiposTelefone.id_telefone_tipo}"></c:out>" 
								<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
									<c:if test="${arrayUsuarioTelefone.id_telefone_tipo == listaTiposTelefone.id_telefone_tipo}"> 
										<c:out value = "selected='selected'"> </c:out>
									</c:if>
								</c:forEach>>
								<c:out value="${listaTiposTelefone.nome}"></c:out>
							</option>
							</c:forEach>
	
					</select>
					<input type="text" name="ddd01" maxlength="3" size="5" value =<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
						<c:out value="${arrayUsuarioTelefone.ddd}"></c:out>
					</c:forEach>>
					<input type="text" name="telefone01" maxlength="9" size="13" value =<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
						<c:out value="${arrayUsuarioTelefone.numero_telefone}"></c:out>
					</c:forEach>>
				</td>
			</tr>
			<tr>
				<td>Telefone 02:</td>
				<td>
					<select name="id_telefone_tipo02">
						<option value="">
							Selecione...
						</option>
						<c:forEach var="listaTiposTelefone" items="${listaTiposTelefone}">
						<option value="<c:out value="${listaTiposTelefone.id_telefone_tipo}"></c:out>" 
							<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
								<c:if test="${arrayUsuarioTelefone.id_telefone_tipo == listaTiposTelefone.id_telefone_tipo}"> 
									<c:out value = "selected"> </c:out>
								</c:if>
							</c:forEach>>
							<c:out value="${listaTiposTelefone.nome}"></c:out>
						</option>
						</c:forEach>
	
					</select>
					<input type="text" name="ddd02" maxlength="3" size="5" value =<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
						<c:out value="${arrayUsuarioTelefone.ddd}"></c:out>
					</c:forEach>>
					<input type="text" name="telefone02" maxlength="9" size="13" value =<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
						<c:out value="${arrayUsuarioTelefone.numero_telefone}"></c:out>
					</c:forEach>>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="Guardar">
	</form>
</body>
<script>
	//alert($("input[name=nome]").val());

</script>
</html>
