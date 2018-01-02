package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojoFiles.SessionBean;
import daoFiles.FilterSessionsDAO;

/**
 * Servlet implementation class FilterServlet
 */
@WebServlet("/FilterSessionsServlet")
public class FilterSessionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FilterSessionsServlet(){
		super();
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String [] selectedSessionCategories = request.getParameterValues("session");
		FilterSessionsDAO filterSessionsDAO = new FilterSessionsDAO();
		List<SessionBean> listOfSessions= filterSessionsDAO.getSelectedSessions(selectedSessionCategories);
		//request.setAttribute("selectedSessionCategories", selectedSessionCategories);
		//System.out.println(listOfSessions);
		request.setAttribute("listOfSessions", listOfSessions);
		request.getRequestDispatcher("FilteredSessionsPage.jsp").forward(request,response);
	}
}
