package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoFiles.RegistrationDAO;
import pojoFiles.SessionBean;
import pojoFiles.UserBean;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		SessionBean sessionBean = new SessionBean();
		sessionBean.setCode(request.getParameter("courseCode").substring(13));
		//System.out.println("hello");
		//System.out.println(sessionBean.getCode());
		UserBean userBean = new UserBean();
		userBean.setEmployeeId(Integer.parseInt(request.getParameter("id")));
		userBean.setName(request.getParameter("name"));
		userBean.setPhoneNumber(Long.parseLong(request
				.getParameter("phoneNumber")));
		userBean.setEmail(request.getParameter("email"));

		RegistrationDAO registrationDAO = new RegistrationDAO();
		registrationDAO.registerUser(userBean, sessionBean);

		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

}
