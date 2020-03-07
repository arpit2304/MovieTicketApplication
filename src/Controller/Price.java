package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Seats")
public class Price extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String movie = request.getParameter("movie");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		int adult = Integer.parseInt(request.getParameter("aTicket"));
		int child = Integer.parseInt(request.getParameter("csTicket"));
		int totalTicket = adult + child;
		double adultPrice;
		if (day.equals("Tuesday")) {
			adultPrice = adult * 5;
		} else {
			adultPrice = adult * 15;
		}
		double childPrice = child * 5;
		double totalPrice = adultPrice + childPrice;

		if (request.getParameter("user") == "yes") {
			totalPrice = totalPrice * (0.80);
			request.setAttribute("user", "yes");
		} else {
			request.setAttribute("user", "no");
		}
		request.setAttribute("movie", movie);
		request.setAttribute("day", day);
		request.setAttribute("time", time);
		request.setAttribute("adult", adult);
		request.setAttribute("child", child);
		request.setAttribute("totalTicket", totalTicket);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("seat", this.seats());
		RequestDispatcher dispatcher = request.getRequestDispatcher("seatBooking.jsp");
		dispatcher.forward(request, response);

	}

	private String seats() {
		String seat = null;

		int[][] chairs = new int[10][10];
		for (int row = 0; row < 10; row++) {
			for (int column = 0; column < 10; column++) {
				chairs[row][column] = row + column;

				seat += chairs[row][column] + " ";
			}
			seat += "\n";
		}

		return seat;
	}

}
