package Operations;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import modle.Account;

/**
 * Servlet implementation class MultiLineChart
 */
@WebServlet(name = "/MultiLineChartYear", urlPatterns = {"/MultiLineChartYear"})
public class MultiLineChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiLineChart() {
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
		// TODO Auto-generated method stub
		ArrayList<Account> _AccountDetails = new ArrayList<>();

		boolean isSuccess;
		Connection connection;
		Statement statement;
		ResultSet resultSet;

		String[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "Sepetember", "October",
				"November", "December" };
		try {

			// Call to the database connection
			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "SELECT Year(Date) , Month(Date) , sum(Msg_Count) FROM daily_sms_report.account where  group by MONTH(Date) , Year(Date)";

			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				do {

					String _YearNumber = resultSet.getString(1);
					String _MonthNumber = resultSet.getString(2);
					int _MsgCount = resultSet.getInt(3);

					Account account = new Account(_YearNumber ,_MonthNumber, _MsgCount);

					_AccountDetails.add(account);

					} while (resultSet.next()); 
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		
		Map<String, List<Account>> mappedData = new HashMap<>();
		
		for(Account data : _AccountDetails) {
			
			if(mappedData.containsKey(data.getAccountName())) {
				
				mappedData.get(data.getAccountName()).add(data);
			}else {
				List<Account> tempList = new ArrayList<Account>();
				tempList.add(data);
				mappedData.put(data.getAccountName(), tempList);
			}
			
		}
		
		  request.setAttribute("mappedData",mappedData);
	        getServletContext().getRequestDispatcher("/LineChartPerYear5.jsp").forward(
	                request, response);
	        return;
		
	}

}
