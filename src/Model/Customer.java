package Model;

import java.io.Serializable;

public class Customer implements Serializable {
	private String userName;
	private String password;
	private String firstName;
	private String lastName;
	private String email;

	public Customer() {

	}

	public Customer(String userName, String password, String firstName, String lastName, String email) {
		this.setUserName(userName);
		this.setPassword(password);
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setEmail(email);
	}

	public Customer(String password, String firstName, String lastName, String email) {
		this.setPassword(password);
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setEmail(email);
	}

	public Customer(String firstName, String lastName, String email) {
		this.setFirstName(firstName);
		this.setLastName(lastName);
		this.setEmail(email);
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	@Override
	public String toString() {
		return "Customer [userName=" + userName + ", password=" + password + ", firstName=" + firstName + ", lastName="
				+ lastName + ", email=" + email + "]";
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
