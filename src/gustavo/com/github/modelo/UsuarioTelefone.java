package gustavo.com.github.modelo;

public class UsuarioTelefone {
	private int id_usuario;
	private int ddd;
	private String numero_telefone;
	private int id_telefone_tipo;
	
	public UsuarioTelefone(int id_usuario, int ddd, String numero_telefone, int id_telefone_tipo) {
		super();
		this.id_usuario = id_usuario;
		this.setDdd(ddd);
		this.setNumero_telefone(numero_telefone);
		this.id_telefone_tipo = id_telefone_tipo;
	}
	
	public UsuarioTelefone() {
		// TODO Auto-generated constructor stub
	}
	
	public int getId_telefone_tipo() {
		return id_telefone_tipo;
	}
	public void setId_telefone_tipo(int id_telefone_tipo) {
		this.id_telefone_tipo = id_telefone_tipo;
	}
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	
	

	@Override
	public String toString() {
		return "UsuarioTelefone [id_usuario=" + id_usuario + ", ddd=" + ddd + ", numero_telefone =" + numero_telefone +", id_telefone_tipo=" + id_telefone_tipo + "]";
	}

	public int getDdd() {
		return ddd;
	}

	public void setDdd(int ddd) {
		this.ddd = ddd;
	}

	public String getNumero_telefone() {
		return numero_telefone;
	}

	public void setNumero_telefone(String numero_telefone) {
		this.numero_telefone = numero_telefone;
	}

}
