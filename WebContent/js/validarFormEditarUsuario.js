$(function (){
	$( "#form_usuario" ).submit(function() {
		var nome = $("input[campo-obrigatorio]").filter(function() {
            return !this.value;
        }).get();
		
        if (nome.length) {
            $(nome).addClass('vazio');
            alert("Todos os campos obrigatórios devem ser preenchidos.");
            return false;
        }
    });
});
