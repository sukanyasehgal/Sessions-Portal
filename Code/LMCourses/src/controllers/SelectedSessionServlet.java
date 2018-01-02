package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojoFiles.SessionBean;
import daoFiles.SelectedSessionDAO;

/**
 * Servlet implementation class SelectedSessionServlet
 */
@WebServlet("/SelectedSessionServlet")
public class SelectedSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectedSessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectedCourseCode = request.getParameter("value");
		SelectedSessionDAO selectedSessionDAO = new SelectedSessionDAO();
		SessionBean session = selectedSessionDAO.getSessionAttributes(selectedCourseCode);
		request.setAttribute("selectedSession", session);
		request.getRequestDispatcher("SelectedSession.jsp").forward(request,response);
	}

	

}
