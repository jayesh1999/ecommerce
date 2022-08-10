package mycart1.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import mycart1.entity.User;
import mycart1.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			try {
				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userPhone = request.getParameter("user_phone");
				String userAddress = request.getParameter("user_address");
				String userImage = "default";
				
				User  user  = new User(userName,userEmail,userPassword,userPhone,userImage,userAddress,"normal");
				
				if(userName.isEmpty()) {
					out.println("Name is Blank");
					return;
				}
				
				try {
					
					Session hibernateSession  = FactoryProvider.getFactory().openSession();
					Transaction tx =  hibernateSession.beginTransaction();
					
					int userId = (int)hibernateSession.save(user);
					
					tx.commit();
					hibernateSession.close();
					
					HttpSession HttpSession  = request.getSession();
					HttpSession.setAttribute("message", "User Register Successfullly!! UserId is " + userId);
					response.sendRedirect("Register.jsp");
					return;
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}				
				

				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
	

}
