<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script> 
<script src="js/validarFormCadastroUsuario.js" type="text/javascript"></script>

<meta charset="UTF-8">
<title>Adicionar um Usuário</title>
</head>
<body>
<c:if test="${!empty sessionScope['usuario']}">
 <table>
 	<tr>
 		<td>
 			Bem vindo <c:out value="${sessionScope.usuario.nome}"/>, deseja fazer <a href="logout">Logout?</a>
 		</td>
 	</tr>
 </table>
</c:if>
<h1>Adicionar um Usuário</h1>
	<form id="form_usuario" action="usuario" method="post">
		<input type="hidden" name="opcao" value="guardar">
		<table border="1">
			<tr>
				<td style="color:red;">Nome:</td>
				<td><input type="text" name="nome" campo-obrigatorio size="50"></td>
			</tr>
			<tr>
				<td style="color:red;">Email:</td>
				<td><input type="email" name="email" campo-obrigatorio size="50"></td>
			</tr>
			<tr>
				<td style="color:red;">Senha:</td>
				<td><input type="password" name="senha" campo-obrigatorio size="50"></td>
			</tr>
			<tr>
				<td>Telefone 01:</td>
				<td>
					<select name="id_telefone_tipo01">
						<option value="">
							Selecione...
						</option>
						<c:forEach var="telefoneTipo" items="${lista}">
						<option value="<c:out value="${telefoneTipo.id_telefone_tipo}"></c:out>">
							<c:out value="${telefoneTipo.nome}"></c:out>
						</option>
						</c:forEach>						
					</select>
					<input type="text" name="ddd01" maxlength="3" size="5">				
					<input type="text" name="telefone01" maxlength="9" size="13">				
				</td>
			</tr>
			<tr>
				<td>Telefone 02:</td>
				<td>
					<select name="id_telefone_tipo02">
						<option value="">
							Selecione...
						</option>
						<c:forEach var="telefoneTipo" items="${lista}">
						<option value="<c:out value="${telefoneTipo.id_telefone_tipo}"></c:out>">
							<c:out value="${telefoneTipo.nome}"></c:out>
						</option>
						</c:forEach>						
					</select>
					<input type="text" name="ddd02" maxlength="3" size="5">				
					<input type="text" name="telefone02" maxlength="9" size="13">				
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>
					Tudo que estiver em
					<font color="red">
						 vermelho 
					</font>
					é obrigatório.
				</td>
			</tr>
		</table>
		<input type="submit" value="Guardar">
	</form>
	
</body>
</html>