package gustavo.com.github.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;
import java.util.List;

import gustavo.com.github.conexao.Conexao;
import gustavo.com.github.modelo.Usuario;

public class UsuarioDAO {
	private Connection connection;
	private PreparedStatement statement;
	private boolean estadoOperacao;
	
	//registrar produto
	public long inserirUsuario(Usuario usuario) throws SQLException {
		String sql = null;
		long id_gerado = 0;
		estadoOperacao = false;
		connection = obterConexao();
		
		try {
			connection.setAutoCommit(false);
			sql = "INSERT INTO usuario(id_usuario, nome, email, senha) VALUES(?, ?, ?, ?)";
			
			statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			
			statement.setString(1, null);
			statement.setString(2, usuario.getNome());
			statement.setString(3, usuario.getEmail());
			statement.setString(4, usuario.getSenha());
			
			estadoOperacao =  statement.executeUpdate() > 0;
			if (estadoOperacao == false) {
				throw new SQLException("Falha na criação do usuário");
			}

			try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					id_gerado = generatedKeys.getLong(1);
				}
				else {
					throw new SQLException("Falha na criação do usuário, nenhum ID obtido.");
				}
			}
			
			connection.commit();
			statement.close();
		} catch (SQLException e) {
			connection.rollback();
			e.printStackTrace();
		}finally{
			System.out.println("fechou");
			connection.close();
		}
		
		return id_gerado;
	}
	//editar produto
	public boolean alterarUsuario(Usuario usuario) throws SQLException {
		String sql = null;
		estadoOperacao = false;
		connection = obterConexao();

		try {
			connection.setAutoCommit(false);
			sql = "UPDATE usuario SET nome = ?, email = ?, senha = ? WHERE id_usuario = ?";
			
			statement = connection.prepareStatement(sql);
			
			statement.setString(1, usuario.getNome());
			statement.setString(2, usuario.getEmail());
			statement.setString(3, usuario.getSenha());
			statement.setInt(4, usuario.getId_usuario());
			
			estadoOperacao = statement.executeUpdate() > 0 ;
			connection.commit();
			statement.close();
			
			
		}
		catch (SQLException e) {
			connection.rollback();
			e.printStackTrace();
		}finally{
			System.out.println("fechou");
			connection.close();
		}
		
		
		return estadoOperacao;
	}
		
	//deleta determinado produto
	public boolean deletarUsuario(int id_usuario) throws SQLException {
		String sql = null;
		estadoOperacao = false;
		connection = obterConexao();

		try {
			connection.setAutoCommit(false);
			sql = "DELETE FROM usuario WHERE id_usuario = ?";
			statement = connection.prepareStatement(sql);
			
			statement.setInt(1, id_usuario);
			
			estadoOperacao = statement.executeUpdate() > 0 ;
			connection.commit();
			statement.close();
			
			
		}
		catch (SQLException e) {
			connection.rollback();
			e.printStackTrace();
		}finally{
			System.out.println("fechou");
			connection.close();
		}
		
		
		return estadoOperacao;
	}
	
	//receber a lista dos usuarios
	public List<Usuario> listarUsuarios() throws SQLException {
		ResultSet resultSet = null;
		List<Usuario> listaUsuarios = new ArrayList<>();
		
		String sql = null;
		estadoOperacao = false;
		connection = obterConexao();

		try {
			sql = "SELECT * FROM usuario ORDER BY nome ASC";
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				Usuario u = new Usuario();
				u.setId_usuario(resultSet.getInt(1));
				u.setNome(resultSet.getString(2));
				u.setEmail(resultSet.getString(3));
				u.setSenha(resultSet.getString(4));
				
				listaUsuarios.add(u);
				
			}
			statement.close();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			System.out.println("fechou");
			connection.close();
		}
		
		return listaUsuarios;
	}
	
	//receber determinado produto
	public Usuario listarUsuario(int id_usuario) throws SQLException {
		ResultSet resultSet = null;
		Usuario u=new Usuario();

		String sql = null;
		estadoOperacao = false;
		connection = obterConexao();

		try {
			sql = "SELECT * FROM usuario WHERE id_usuario =?";
			statement=connection.prepareStatement(sql);
			statement.setInt(1, id_usuario);
			
			resultSet = statement.executeQuery();
			
			if(resultSet.next()) {				
				u.setId_usuario(resultSet.getInt(1));
				u.setNome(resultSet.getString(2));
				u.setEmail(resultSet.getString(3));
				u.setSenha(resultSet.getString(4));
			}
			statement.close();
			resultSet.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			System.out.println("fechou");
			connection.close();
		}

		return u;
	}
	public Usuario login(Usuario u) throws SQLException {
		ResultSet resultSet = null;

		Usuario usuario =new Usuario();

		String sql = null;
		estadoOperacao = false;
		connection = obterConexao();

		try {
			sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
			statement=connection.prepareStatement(sql);
			statement.setString(1, u.getEmail());
			statement.setString(2, u.getSenha());
			resultSet = statement.executeQuery();

			if(resultSet.next()) {				
				usuario.setId_usuario(resultSet.getInt(1));
				usuario.setNome(resultSet.getString(2));
				usuario.setEmail(resultSet.getString(3));
				usuario.setSenha(resultSet.getString(4));
			}
			statement.close();
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			System.out.println("fechou");
			connection.close();
		}

		return usuario;
	}
	
	
	//obter conexao 
	private Connection obterConexao() throws SQLException {
		return Conexao.getConnection();
	}
	
}
