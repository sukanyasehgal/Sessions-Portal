package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daoFiles.AdminLoginDAO;
import pojoFiles.AdminLoginBean;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		AdminLoginBean adminLoginBean = new AdminLoginBean();
		adminLoginBean.setUsername(request.getParameter("username"));
		adminLoginBean.setPassword(request.getParameter("password"));
		AdminLoginDAO adminLoginDAO = new AdminLoginDAO();
		boolean exists = adminLoginDAO.authenticateAdmin(adminLoginBean);
		if (exists == true) {

			HttpSession session = request.getSession(true);
			session.setAttribute("currentSessionUser", adminLoginBean);
			request.getRequestDispatcher("adminHome.jsp").forward(request, response);

		}
		// if user is not valid then redirect to login page again with a message
		else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid username or password');");
			out.println("location='index.jsp';");
			out.println("</script>");
			request.setAttribute("valid", "incorrect credentials");
		}
	}
}
