package gustavo.com.github.controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gustavo.com.github.dao.UsuarioDAO;
import gustavo.com.github.modelo.Usuario;

/**
 * Servlet implementation class LoginControlador
 */
@WebServlet(description = "Controla o Login", urlPatterns = { "/login" })
public class LoginControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
		requestDispatcher.forward(request, response);

		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String opcao = request.getParameter("opcao");
		if (opcao.equals("login")) {
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			Usuario usuario = new Usuario();
			
			try {
				usuario.setEmail(request.getParameter("email"));
				usuario.setSenha(request.getParameter("senha"));
				usuario = usuarioDAO.login(usuario);
				HttpSession session=request.getSession();  
		        
				if(usuario.getId_usuario() != 0) {
					//conseguiu fazer login
					session.setAttribute("usuario", usuario);  
					session.setAttribute("msgAviso", "Login efetudo com sucesso!");
					session.setAttribute("msgAvisoCor", "green");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/principal.jsp");
					requestDispatcher.forward(request, response);

				}
				else {
					//não conseguiu fazer login
					session.setAttribute("msgAviso", "E-mail e/ou senha inválido.");
					session.setAttribute("msgAvisoCor", "red");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
					requestDispatcher.forward(request, response);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/principal.jsp");
		//requestDispatcher.forward(request, response);

		//doGet(request, response);
	}

}
