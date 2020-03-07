package DBUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Model.Customer;

public class CustomerDBUtil {
	private void close(Connection myConn, ResultSet myrs, Statement mystmt) throws SQLException {
		if (myConn != null) {
			myConn.close();
		}
		if (myrs != null)
			myrs.close();
		if (mystmt != null)
			mystmt.close();
	}
	
	public List<Customer> getCustomer() throws SQLException {
		List<Customer> customers = new ArrayList<>();
		Connection myConn = null;
		Statement mystmt = null;
		ResultSet myrs = null;
		try {
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root", "Sar_s234");
			String sql = "Select * from customers";
			mystmt = myConn.createStatement();
			myrs = mystmt.executeQuery(sql);

			while (myrs.next()) {
				String userName = myrs.getString("user_id");
				String password = myrs.getString("password");
				String fname = myrs.getString("fname");
				String lname = myrs.getString("lname");
				String email = myrs.getString("email");
				Customer tempCustomer = new Customer(userName,password,fname,lname,email);
				customers.add(tempCustomer);
			}
			return customers;
		} finally {
			close(myConn, myrs, mystmt);
		}
	}
	
	public Customer getCustomer(String theCustomerId) throws Exception {
		Customer theCustomer = null;
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		String customerId;
		
		try {
			customerId = theCustomerId;
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root", "Sar_s234");
			String sql = "Select * from customers where id=?";
			myStmt.setString(1, customerId);
			myRs = myStmt.executeQuery();
			if(myRs.next()) {
				String password = myRs.getString("password");
				String fname = myRs.getString("fname");
				String lname = myRs.getString("lname");
				String email = myRs.getString("email");
				theCustomer = new Customer(customerId,password,fname,lname,email);
			}else {
				throw new Exception("Could not find the Customer!!!");
			}

		} finally {
			close(myConn, null, myStmt);
		}
		return theCustomer;
		}
	
	public void deleteCustomer(String theCustomerId) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try {
			String customerId = theCustomerId;
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root", "Sar_s234");
			String sql = "delete from customers where id=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, customerId);
			myStmt.execute();

		} finally {
			close(myConn, null, myStmt);
		}
	}
	
public void addCustomer(Customer theCustomer) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		//Guaranteed -> PrepareStatement vs Statements
		//performance(speed)
		//know when to use which
		
		try {
			//get db connection
			myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root", "Sar_s234");
			//create sql statement
			
			String sql = "insert into customrs (user_id,password,fname,lname,emaail)values(?,?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			//set the parameter values for the student
			myStmt.setString(1, theCustomer.getUserName());
			myStmt.setString(2, theCustomer.getPassword());
			myStmt.setString(3, theCustomer.getFirstName());
			myStmt.setString(4, theCustomer.getLastName());
			myStmt.setString(5, theCustomer.getEmail());
			
			myStmt.execute();
			
		}
		finally {
			
			close(myConn,null,myStmt);
		}
	}

public void updateCustomer(Customer theCustomer) throws Exception{
	
	Connection myConn = null;
	PreparedStatement myStmt = null;
	
	try {
		myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customers", "root", "Sar_s234");

		String sql = "update customers set password=?,fname=?,lname=?,email=? where user_id=?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setString(1, theCustomer.getPassword());
		myStmt.setString(2, theCustomer.getFirstName());
		myStmt.setString(3, theCustomer.getLastName());
		myStmt.setString(4, theCustomer.getEmail());
		myStmt.setString(5, theCustomer.getUserName());
		myStmt.execute();
	}
	finally {
		close(myConn,null,myStmt);
	}
}


}


