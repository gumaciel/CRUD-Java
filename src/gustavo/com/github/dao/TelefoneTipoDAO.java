package gustavo.com.github.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import gustavo.com.github.conexao.Conexao;
import gustavo.com.github.modelo.TelefoneTipo;


public class TelefoneTipoDAO {
	private Connection connection;
	private PreparedStatement statement;
//	private boolean estadoOperacao;
	
	public List<TelefoneTipo> listarTelefoneTipo() throws SQLException {
		ResultSet resultSet = null;
		List<TelefoneTipo> listaProdutos = new ArrayList<>();
		
		String sql = null;
		//estadoOperacao = false;
		connection = obterConexao();

		try {
			sql = "SELECT * FROM telefone_tipo";
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				TelefoneTipo tt = new TelefoneTipo();
				tt.setId_telefone_tipo(resultSet.getInt(1));
				tt.setName(resultSet.getString(2));
				
				listaProdutos.add(tt);
				
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			System.out.println("fechou");
			connection.close();
		}
		
		return listaProdutos;
	}
	public List<TelefoneTipo> listarTelefoneTipoPorID(int id_telefone_tipo) throws SQLException {
		ResultSet resultSet = null;
		List<TelefoneTipo> arrayTelefoneTipo = new ArrayList<>();
		
		String sql = null;
		//estadoOperacao = false;
		connection = obterConexao();

		try {
			sql = "SELECT * FROM telefone_tipo WHERE id_telefone_tipo =?";
			statement=connection.prepareStatement(sql);
			statement.setInt(1, id_telefone_tipo);
			
			resultSet = statement.executeQuery();
			
			if(resultSet.next()) {
				TelefoneTipo tt=new TelefoneTipo();
				
				tt.setId_telefone_tipo(resultSet.getInt(1));
				tt.setName(resultSet.getString(2));
				
				arrayTelefoneTipo.add(tt);

			}
			statement.close();
			resultSet.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			System.out.println("fechou");
			connection.close();
		}

		return arrayTelefoneTipo;
	}
	
	private Connection obterConexao() throws SQLException {
		return Conexao.getConnection();
	}
	
}
