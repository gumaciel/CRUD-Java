<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script> 
	<script src="js/validarFormCadastroUsuario.js" type="text/javascript"></script>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
		
	<meta charset="UTF-8">
	<title>Adicionar um Usuário</title>
	<script type="text/javascript">
		  $(document).ready(function(){
		    $('select').formSelect();
		  });
	</script>

</head>
<body>
<div class="container">

<c:if test="${!empty sessionScope['usuario']}">
<table class="orange lighten-4">
	<tr>
 		<td>
			<font size="3">
				Bem vindo <c:out value="${sessionScope.usuario.nome}"/>, deseja fazer <a href="logout">Logout?</a>
			</font>
		</td>
	</tr>
</table>
</c:if>
	<h1>Adicionar um Usuário</h1>
	<form id="form_usuario" action="usuario" method="post">
		<input type="hidden" name="opcao" value="guardar">
		<table border="1" class="highlight">
			<tr>
				<td>
					<div class="input-field col s6">
						<i class="material-icons prefix">account_box</i>
						<input id="nome_prefix" type="text" class="validate" campo-obrigatorio size="30" name="nome">
						<label for="nome_prefix">Nome <font color="red">(Obrigatório)</font></label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">
						<i class="material-icons prefix">email</i>
						<input id="email_prefix" type="email" class="validate"  name="email">
						<label for="email_prefix">E-mail <font color="red">(Obrigatório)</font></label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s6">
						<i class="material-icons prefix">security</i>
						<input id="senha_prefix" type="password" class="validate" name="senha">
						<label for="senha_prefix">Senha <font color="red">(Obrigatório)</font></label>
			        </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s5">
						<div class="left-align">
							<i class="material-icons prefix">phone</i>
							<label>Telefone 01</label>
						</div>
						<select name="id_telefone_tipo01">
							<option value="">Selecione o tipo de telefone...</option>
							<c:forEach var="telefoneTipo" items="${lista}">
							<option value="<c:out value="${telefoneTipo.id_telefone_tipo}"></c:out>"><c:out value="${telefoneTipo.nome}"></c:out></option>
							</c:forEach>						
						</select>
						<div class="input-field col s1">
							<input id="ddd01_prefix" type="text" name="ddd01" maxlength="3" size="5">
							<label for="ddd01_prefix">DDD </label>
				        </div>
						<div class="input-field col s1">
							<input id="numero01_prefix" type="text" name="telefone01" maxlength="9" size="13">
							<label for="numero01_prefix">Número de telefone </label>
				        </div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-field col s5">
						<div class="left-align">
							<i class="material-icons prefix">phone</i>
							<label>Telefone 02</label>
						</div>
						<select name="id_telefone_tipo02">
							<option value="">Selecione o tipo de telefone...</option>
							<c:forEach var="telefoneTipo" items="${lista}">
							<option value="<c:out value="${telefoneTipo.id_telefone_tipo}"></c:out>"><c:out value="${telefoneTipo.nome}"></c:out></option>
							</c:forEach>						
						</select>
						<div class="input-field col s1">
							<input id="ddd02_prefix" type="text" name="ddd02" maxlength="3" size="5">
							<label for="ddd02_prefix">DDD </label>
				        </div>
						<div class="input-field col s1">
							<input id="numero02_prefix" type="text" name="telefone02" maxlength="9" size="13">
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
		  <button class="btn-large waves-effect waves-light" type="submit" value="Guardar">Guardar
		    <i class="material-icons right">add_circle_outline</i>
		  </button>
		</div>
		<br>
		<c:if test="${!empty sessionScope['usuario']}">
			<div class="center-align">
				<a class="waves-effect waves-light btn-large" href= "usuario?opcao=voltar&view=principal.jsp"><i class="material-icons right">arrow_back</i>Voltar</a>
			</div>
		</c:if>
		<c:if test="${empty sessionScope['usuario']}">
			<div class="center-align">
				<a class="waves-effect waves-light btn-large" href= "usuario?opcao=voltar"><i class="material-icons right">arrow_back</i>Voltar</a>
			</div>
		</c:if>
		<br>
	</form>
</div>
</body>
</html>