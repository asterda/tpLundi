package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ecommerce.Application;
import ecommerce.model.Login;
import ecommerce.model.Role;

/**
 * Servlet implementation class AuthController
 */
@WebServlet("/AuthController")
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null && action.equals("deconnexion")) {
			request.getSession().invalidate();
		}
		response.sendRedirect("/tpLundi/Accueil");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		Login user = Application.getInstance().getLoginDao().findByLoginAndPass(login, password);
		
		/*
		 * Cas :
		 * 1) inconnu -> pas loggé
		 * 2) user -> loggé
		 * 3) admin -> loggé
		 * 
		 */
		// 1)
		if(user == null) {
			request.setAttribute("messageErreur", "Erreur: login ou mot de passe incorrect.");
		}else {
			if(user.getRole() == Role.USER) {
				request.getSession().setAttribute("isUser", true);
				request.getSession().setAttribute("isAdmin", false);
			}else if(user.getRole() == Role.ADMIN) {
				request.getSession().setAttribute("isUser", true);// Un admin a les prérogatives d'un user
				request.getSession().setAttribute("isAdmin", true);
			}
		}
		request.getRequestDispatcher("accueil.jsp").forward(request, response);

		
	}

}
