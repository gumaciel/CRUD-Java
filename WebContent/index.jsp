
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<h1>Login </h1>
	<form action="login" method="post">
		<input type="hidden" name="opcao" value="login">
		<table border="1">
			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" size="50"></td>
			</tr>
			<tr>
				<td>Senha:</td>
				<td><input type="password" name="senha" size="50"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
	<table>
		<tr>
			<td>
				<a href= "usuario?opcao=criar">Registrar um Usuário</a>
			</td>
		</tr>
		<tr>
			<td>
				<font color="red">
					<c:out value="${sessionScope.msgAviso}"/>
				</font>
			</td>
		</tr>
	</table>
	<c:set var="msgAviso" value="" scope="session" />	
</body>
</html>