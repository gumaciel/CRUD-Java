<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script> 
	<script src="js/validarFormEditarUsuario.js" type="text/javascript"></script>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


	
	<c:if test="${empty sessionScope['usuario']}">
		<c:set var="msgAviso" value="Você precisa entrar no sistema para ter acesso a esse conteúdo" scope="session" />
		<c:redirect url="index.jsp" />
	</c:if>
	
	<meta charset="UTF-8">
	<title>Editar Produto</title>
	<script type="text/javascript">
		  $(document).ready(function(){
		    $('select').formSelect();
		  });
		  $(document).ready(function() {
		    $('select').material_select();
		  });
  </script>
	
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

	<h1>Editar Produto</h1>
	<form id="form_usuario" action="usuario" method="post">
	<c:set var="usuario" value="${usuario}"></c:set>
		<input type="hidden" name="opcao" value="editar">
		<input type="hidden" name="id_usuario" value="${usuario.id_usuario}">
		<table border="1">
			<tr>
				<td>
					<div class="input-field col s6">
						<i class="material-icons prefix">account_box</i>
						<input id="nome_prefix" type="text" class="validate" campo-obrigatorio size="30" name="nome" value="${usuario.nome}">
						<label for="nome_prefix">Nome <font color="red">(Obrigatório)</font></label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">
						<i class="material-icons prefix">email</i>
						<input id="email_prefix" type="email" class="validate"  name="email" value="${usuario.email}">
						<label for="email_prefix">E-mail <font color="red">(Obrigatório)</font></label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">
						<i class="material-icons prefix">security</i>
						<input id="senha_prefix" type="password" class="validate" name="senha" value="${usuario.senha}">
						<label for="senha_prefix">Senha <font color="red">(Obrigatório)</font></label>
			        </div>
				</td>
			</tr>

			<tr>
				<td>
					<div class="input-field col s12">
						<div class="left-align">
							<i class="material-icons prefix">phone</i>
							<label>Telefone 01</label>
						</div>
					
						<select name="id_telefone_tipo01">
							<option value="">Selecione...</option>
								<c:forEach var="listaTiposTelefone" items="${listaTiposTelefone}">
								<option value="<c:out value="${listaTiposTelefone.id_telefone_tipo}"></c:out>" 
									<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
										<c:if test="${arrayUsuarioTelefone.id_telefone_tipo == listaTiposTelefone.id_telefone_tipo}"> 
											<c:out value = "selected='selected'"> </c:out>
										</c:if>
									</c:forEach>><c:out value="${listaTiposTelefone.nome}"></c:out>
								</option>
								</c:forEach>
						</select>
						<div class="input-field col s1">
							<input id="ddd01_prefix" type="text" name="ddd01" maxlength="3" size="5" value =<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
								<c:out value="${arrayUsuarioTelefone.ddd}"></c:out>
							</c:forEach>>
							<label for="ddd01_prefix">DDD </label>
				        </div>
						<div class="input-field col s1">
							<input id="numero01_prefix" type="text" name="telefone01" maxlength="9" size="13"value =<c:forEach var="arrayUsuarioTelefone" begin="0" end="0" items="${arrayUsuarioTelefone}">
								<c:out value="${arrayUsuarioTelefone.numero_telefone}"></c:out>
							</c:forEach>>
							<label for="numero01_prefix">Número de telefone </label>
				        </div>
					</div>

				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s12">
						<div class="left-align">
							<i class="material-icons prefix">phone</i>
							<label>Telefone 02</label>
						</div>
					
						<select name="id_telefone_tipo02">
							<option value="">Selecione...</option>
								<c:forEach var="listaTiposTelefone" items="${listaTiposTelefone}">
								<option value="<c:out value="${listaTiposTelefone.id_telefone_tipo}"></c:out>" 
									<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
										<c:if test="${arrayUsuarioTelefone.id_telefone_tipo == listaTiposTelefone.id_telefone_tipo}"> 
											<c:out value = "selected='selected'"> </c:out>
										</c:if>
									</c:forEach>><c:out value="${listaTiposTelefone.nome}"></c:out>
								</option>
								</c:forEach>
						</select>
						<div class="input-field col s1">
							<input id="ddd02_prefix" type="text" name="ddd02" maxlength="3" size="5" value =<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
								<c:out value="${arrayUsuarioTelefone.ddd}"></c:out>
							</c:forEach>>
							<label for="ddd02_prefix">DDD </label>
				        </div>
						<div class="input-field col s1">
							<input id="numero02_prefix" type="text" name="telefone02" maxlength="9" size="13"value =<c:forEach var="arrayUsuarioTelefone" begin="1" end="1" items="${arrayUsuarioTelefone}">
								<c:out value="${arrayUsuarioTelefone.numero_telefone}"></c:out>
							</c:forEach>>
							<label for="numero02_prefix">Número de telefone </label>
				        </div>
					</div>

				</td>
			</tr>
			
		</table>
		<table>
			<tr>
				<td class="center-align">
					<font size="5">
						Tudo que estiver em
						<font color="red">
							 vermelho 
						</font>
					é obrigatório.
					</font>
				</td>
			</tr>
		</table>
		<div class="center-align">
		  <button class="btn-large waves-effect waves-light" type="submit" value="Guardar">Editar
		    <i class="material-icons right">edit</i>
		  </button>
		</div>
		<br>
		</form>
	</div>
</body>
</html>
