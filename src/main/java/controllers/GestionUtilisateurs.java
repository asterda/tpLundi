package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.Application;
import ecommerce.model.Login;
import ecommerce.model.Role;

/**
 * Servlet implementation class GestionUtilisateurs
 */
@WebServlet("/GestionUtilisateurs")
public class GestionUtilisateurs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionUtilisateurs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getSession().setAttribute("isAdmin", true);
		if(request.getSession().getAttribute("isAdmin") != null && (Boolean) request.getSession().getAttribute("isAdmin") == true) {
			// Gestion action suppression
			String action = request.getParameter("action");
			String id = request.getParameter("id");
			if(action != null && action.equals("del") && id != null) {
				Application.getInstance().getLoginDao().delete(Application.getInstance().getLoginDao().find(Long.parseLong(id)));
			}
			
			// Affichage final
			List<Login> utilisateurs = Application.getInstance().getLoginDao().findAll();
			request.setAttribute("utilisateurs", utilisateurs);
			request.getRequestDispatcher("gestionUtilisateurs.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("Accueil.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("isAdmin", true);
		if(request.getSession().getAttribute("isAdmin") != null && (Boolean) request.getSession().getAttribute("isAdmin") == true) {
			// Variables formulaires
			String login = request.getParameter("login");
			String password = request.getParameter("password");
			String roleStr = request.getParameter("role");
			Role role = null;
			if(roleStr.equals("ADMIN")) {
				role = Role.ADMIN;
			}
			else if(roleStr.equals("USER")) {
				role = Role.USER;
			}
			// Création Login
			if(login != null && !login.equals("") && password != null && !password.equals("") && role != null) {
				Login nouveauLogin = new Login();
				nouveauLogin.setLogin(login);
				nouveauLogin.setMotDePasse(password);
				nouveauLogin.setRole(role);
				Application.getInstance().getLoginDao().create(nouveauLogin);
			}
			doGet(request, response);
		}else {
			request.getRequestDispatcher("Accueil.jsp").forward(request, response);
		}		
	}

}
