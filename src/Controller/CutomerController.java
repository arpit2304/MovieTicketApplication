package Controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBUtil.CustomerDBUtil;
import Model.Customer;




@WebServlet("/CutomerController")
public class CutomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerDBUtil customerDbutil;
   @Resource(name="jdbc/CustomerDBUtil")
   
   public void init() throws ServletException{ //see notes on servlet life cycle
	   
	   super.init();
	   
	   try {
	
		   
		   customerDbutil = new CustomerDBUtil();
		   
	   }
	   catch(Exception ex) {
		   throw new ServletException(ex);
	   }
   }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		
			String theCommand=request.getParameter("command");

			if(theCommand==null) {
				theCommand="LIST";
			}
			
			switch(theCommand) {
			case "LIST":
				listCustomers(request,response);
				break;
			case "ADD":
				addCustomers(request,response);
				break;
			case "LOAD":
				loadCustomers(request,response);
				break;
			case "UPDATE":
				updateCustomers(request,response);
				break;
			case "DELETE":
				deleteCustomers(request,response);
				break;
				
				default:
					listCustomers(request,response);
			}
		}catch(Exception ex) {
			ex.getMessage();
		}
	}

	private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//get students from the database
		List<Customer> customers = customerDbutil.getCustomer();
		
		//add students to the request
		request.setAttribute("CUSTOMER_LIST", customers);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-customers.jsp");
		dispatcher.forward(request,response);
	}
	private void addCustomers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read student info from form data
		String firstName= request.getParameter("firstName");
		String lastName= request.getParameter("lastName");
		String email= request.getParameter("email");
		String password = request.getParameter("password");
		String userName = request.getParameter("userName");
		//create a new student object
		
		Customer theCustomer = new Customer(userName,password,firstName,lastName,email);
		

		customerDbutil.addCustomer(theCustomer);

		listCustomers(request,response);
	}
	private void loadCustomers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read student info from form data
		String theCustomerId = request.getParameter("userName");
		//get student from the database
		
		Customer theCustomer = customerDbutil.getCustomer(theCustomerId);
		
		//place Student in the request attribute
		request.setAttribute("THE_Customer",theCustomer);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-customer-form.jsp");
		dispatcher.forward(request,response);
	}
	private void updateCustomers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read student info from form data
		String id = request.getParameter("userName");
		String password = request.getParameter("password");
		String firstName= request.getParameter("firstName");
		String lastName= request.getParameter("lastName");
		String email= request.getParameter("email");
		// create a new student object
		Customer theCustomer = new Customer(id,password,firstName,lastName,email);
		
		//perform an update on the database
		customerDbutil.updateCustomer(theCustomer);
		//sends them to list students page
		listCustomers(request,response);
		
	}
	private void deleteCustomers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//read student id from form data
		String id = request.getParameter("userName");
		//delete the student
		customerDbutil.deleteCustomer(id);
		//sends them to list students page
		listCustomers(request,response);
	
	}

	
	
}
