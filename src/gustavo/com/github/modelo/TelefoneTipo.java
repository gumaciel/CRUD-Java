package gustavo.com.github.modelo;

public class TelefoneTipo {
	private int id_telefone_tipo;
	private String nome;
	
	public TelefoneTipo(int id_telefone_tipo, String nome) {
		super();
		this.id_telefone_tipo = id_telefone_tipo;
		this.nome = nome;
	}
	
	public TelefoneTipo() {
		// TODO Auto-generated constructor stub
	}
	
	public int getId_telefone_tipo() {
		return id_telefone_tipo;
	}
	public void setId_telefone_tipo(int id_telefone_tipo) {
		this.id_telefone_tipo = id_telefone_tipo;
	}
	public String getNome() {
		return nome;
	}
	public void setName(String nome) {
		this.nome = nome;
	}
	

	@Override
	public String toString() {
		return "TelefoneTipo [id_telefone_tipo=" + id_telefone_tipo + ", nome=" + nome + "]";
	}

	
}
