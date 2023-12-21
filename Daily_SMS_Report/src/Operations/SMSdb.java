package Operations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import Database.DBConnection;
import modle.Account;
import modle.Data_Year;

public class SMSdb {

	private static boolean isSuccess;
	private static Connection connection;
	private static Statement statement;
	private static ResultSet resultSet;

	public boolean InsertValue(String account, int count, String date) {

		isSuccess = false;

		try {

			connection = DBConnection.GetConnection();
			statement = connection.createStatement();

			String _Sql = "insert into account(Account_Name , Msg_Count , Date) values ('" + account + "','" + count
					+ "','" + date + "')";
			int _ResultSet = statement.executeUpdate(_Sql);

			if (_ResultSet > 0) {

				isSuccess = true;
			} else {

				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;

	}

	public static ArrayList<Account> ViewDatabyMonthly(String monthNumber) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		System.out.println("Just Enteer to the ViewDataByMonthly function");

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select * from account where MONTH(Date) = '" + monthNumber + " '";
			// String _Sql = "select id , Account_Name , Date , sum(Msg_Count) as 'SUM' from
			// daily_sms_report.account where MONTH(Date) = '"+monthNumber+"' group by
			// Account_Name order by SUM DESC";
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				do {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					System.out.println("View Data by Monthlyyyyyyyyyyy" + _AccountName);
					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);

					_AccountDetails.add(account);

				} while (resultSet.next());
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public ArrayList<Account> ViewDatabyName(String accountName) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select * from account where Account_Name = '" + accountName + "'";

			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				while (resultSet.next()) {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					System.out.println("Msssssssg" + _AccountName);

					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);

					_AccountDetails.add(account);
				}

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		System.out.println();
		return _AccountDetails;

	}

	public ArrayList<Account> ViewDatabyDate(String date) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select * from account where Date = '" + date + "' order by Msg_Count desc";

			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				do {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);
					_AccountDetails.add(account);// Store details in the arraylist

				}while(resultSet.next());
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public String TotalMsgsPerDay(String date) {

		int _MsgCount = 0;

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "SELECT * FROM daily_sms_report.totalcountbydate where Date = '" + date + "'";

			resultSet = statement.executeQuery(_Sql);

			while (resultSet.next()) {

				_MsgCount = resultSet.getInt(1);

				System.out.println("kkkkkkkkkkk" + _MsgCount);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		String _Count = String.valueOf(_MsgCount);
		return _Count;

	}

	public int ViewData(String date, String name) throws SQLException {

		ArrayList _MsgCounts = new ArrayList<>();
		String _Count = null;
		int _CountNew = 1;

		try {

			
			connection = DBConnection.GetConnection();
			
			statement = connection.createStatement();

			

			String _Sql = ("select * from daily_sms_report.account where Date = '" + date + "' and Account_Name ='"
					+ name + "'");
			// String sql = ("select * from user where username ='"+username+"' and password
			// ='"+password+"'");

			
			resultSet = statement.executeQuery(_Sql);

			System.out.println("ddddddddddddddddddddddddd" + resultSet);
			
			System.out.println("in in");

			if (resultSet.next()) {
				resultSet.getInt(1);
				resultSet.getString(2);
				resultSet.getString(3);

				_Count = resultSet.getString(4);
				System.out.println("yessssssssssss");
			} else {
				System.out.println("nooooooooooooooooooo");
				_Count = "0";
				System.out.println(date);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		try {
			_CountNew = Integer.parseInt(_Count);
			System.out.println("cccccccccccccccccccccccccccccccc" + resultSet.next());

		} catch (NumberFormatException e) {

		}
		return _CountNew;

	}

	public ArrayList<Account> ViewDatabyMonthlyChart(String monthNumber) {

		
		ArrayList<Account> _AccountDetails = new ArrayList<>();

		try {

		
			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			// Declare the sql statement for retrieve all employee details
			// String _Sql = "select * from totalcountmonthlychart where Month= ' " +
			// monthNumber + " ' order by SumMsgCount desc LIMIT 20";
			String _Sql = "select * from  totalcountmonthlychart where Month= ' " + monthNumber
					+ " 'order by  SumMsgCount desc LIMIT 20";
			
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				
				System.out.println("in in");

				do {
					// int id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(1);
					// String Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(2);

					Account account = new Account(_AccountName, _MsgCount);

					_AccountDetails.add(account);
					
				} while (resultSet.next()); 			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public ArrayList<Account> ViewDatabyDatePerMonthChart(String monthNumber) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		try {

			
			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "SELECT * FROM daily_sms_report.totalcountbydate where month(Date) = '" + monthNumber + "'";

			
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				
				System.out.println("in in");

				while (resultSet.next()) {
					// int id = resultSet.getInt(1);
					// String AccountName = resultSet.getString(1);
					int _MsgCount = resultSet.getInt(0);
					String _Date = resultSet.getString(1);

					Account account = new Account();

					// account.setDate(_Date);
					// account.setMsgCount(_MsgCount);

					account.Account1(_Date, _MsgCount);

					_AccountDetails.add(account);

				}
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public static Map<String, List> TotalMsgsPerDayAll(String monthNumber) {

		int _MsgCount = 0;
		String _Date = null;

		Map<String, List> _Map = null;
		ArrayList<Account> accounts = new ArrayList();
		ArrayList<String> _Dates = new ArrayList();
		ArrayList<Integer> _MsgCounts = new ArrayList();
		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "SELECT * FROM daily_sms_report.totalcountbydate where month(Date) = '" + monthNumber + "'";

			resultSet = statement.executeQuery(_Sql);

			while (resultSet.next()) {

				_MsgCount = resultSet.getInt(1);
				_Date = resultSet.getString(2);

				System.out.println("kkkkkkkkkkk" + _MsgCount);

				_Dates.add(_Date);
				_MsgCounts.add(_MsgCount);

			}

			_Map.put("dates", _Dates);
			_Map.put("msgCounts", _MsgCounts);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _Map;

	}

	public ArrayList<Account> ViewDatabyMonthDate(String monthNumber, String date) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		System.out.println("Just Enteer to the ViewDataByMonthly function");

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select * from account where month(Date)='" + monthNumber + "' and day(Date)='" + date
					+ "' order by Account_Name asc";
			// String _Sql = "select id,Account_Name,Date,format(Msg_Count,0) from account
			// where month(Date)='"+monthNumber+"' and day(Date)='"+date+"' order by
			// Account_Name asc";

			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				/* while (resultSet.next()) */do {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					System.out.println("View Data by Monthlyyyyyyyyyyy111111" + _AccountName);
					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);// Store the results in

					_AccountDetails.add(account);

				} while (resultSet.next());
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public ArrayList<Account> ViewDatabyMonthlyTotal(String monthNumber, String name) {

	
		ArrayList<Account> _AccountDetails = new ArrayList<>();

		try {

			
			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			
			String _Sql = "select * from  totalcountmonthlychart where Month= " + monthNumber;

			
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				
				System.out.println("in in");

				while (resultSet.next()) {
					// int id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(1);
					// String Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(2);

					Account account = new Account(_AccountName, _MsgCount);

					_AccountDetails.add(account);

				} 
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public ArrayList<Account> ViewDatabyMonthDateName(String monthNumber, String name, String date) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		System.out.println("Just Enteer to the ViewDataByMonthly function");

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select * from account where month(Date)='" + monthNumber + "' and day(Date)='" + date
					+ "' and Account_Name='" + name + "'";

			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				while (resultSet.next()) {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					System.out.println("View Data by Monthlyyyyyyyyyyy" + _AccountName);
					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);

					_AccountDetails.add(account);

				} 
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public String TotalMsgsPerMonth(String monthNumber) {

		int _MsgCount = 0;

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select sum(Msg_Count) from daily_sms_report.account where month(Date)='" + monthNumber + "'";

			resultSet = statement.executeQuery(_Sql);

			while (resultSet.next()) {

				_MsgCount = resultSet.getInt(1);

				System.out.println("kkkkkkkkkkk" + _MsgCount);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		String _Count = String.valueOf(_MsgCount);
		return _Count;

	}

	public ArrayList<Account> ViewDatabyMonthDate1(String monthNumber, String year, String date) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		System.out.println("Just Enteer to the ViewDataByMonthly function");

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select id,Account_Name,Date,Msg_Count from account where month(Date)='"
					+ monthNumber + "' and day(Date)='" + date + "' and year(Date) = '" + year
					+ "' order by Account_Name asc";

			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				do {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					System.out.println("View Data by Monthlyyyyyyyyyyy111111" + _AccountName);
					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);

					_AccountDetails.add(account);
				} while (resultSet.next());
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public static ArrayList<Account> ViewDatabyMonthly1(String monthNumber, String year) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		System.out.println("Just Enteer to the ViewDataByMonthly function");

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select * from account where MONTH(Date) = '" + monthNumber + " ' and YEAR(Date) = '" + year
					+ "'";
			// String _Sql = "select id , Account_Name , Date , sum(Msg_Count) as 'SUM' from
			// daily_sms_report.account where MONTH(Date) = '"+monthNumber+"' group by
			// Account_Name order by SUM DESC";
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				do {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					System.out.println("View Data by Monthlyyyyyyyyyyy" + _AccountName);
					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);

					_AccountDetails.add(account);

				} while (resultSet.next()); 
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public static ArrayList<Account> ViewDatabyName(String monthNumber, String year) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		System.out.println("Just Enteer to the ViewDataByMonthly function");

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select * from account where MONTH(Date) = '" + monthNumber + " ' and YEAR(Date) = '" + year
					+ "'";
			// String _Sql = "select id , Account_Name , Date , sum(Msg_Count) as 'SUM' from
			// daily_sms_report.account where MONTH(Date) = '"+monthNumber+"' group by
			// Account_Name order by SUM DESC";
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				do {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					System.out.println("View Data by Monthlyyyyyyyyyyy" + _AccountName);
					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);

					_AccountDetails.add(account);

				} while (resultSet.next()); 
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public static ArrayList<Account> DataForLineChart(String monthNumber, String year, String date,
			String accountName) {

		ArrayList<Account> _AccountDetails = new ArrayList<>();

		System.out.println("Just Enteer to the ViewDataByMonthly function");

		try {

			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			String _Sql = "select * from account where MONTH(Date) = '" + monthNumber + " ' and YEAR(Date) = '" + year
					+ "' and Account_Name = '" + accountName + "' and day(Date) = ' " + date + "'";
			// String _Sql = "select id , Account_Name , Date , sum(Msg_Count) as 'SUM' from
			// daily_sms_report.account where MONTH(Date) = '"+monthNumber+"' group by
			// Account_Name order by SUM DESC";
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				System.out.println("in in");

				do {
					int _Id = resultSet.getInt(1);
					String _AccountName = resultSet.getString(2);
					String _Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(4);

					System.out.println("View Data by Monthlyyyyyyyyyyy" + _AccountName);
					Account account = new Account(_Id, _AccountName, _Date, _MsgCount);

					_AccountDetails.add(account);

				} while (resultSet.next()); 
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

	public ArrayList<Account> ViewDataByYear(String year) {

	
		ArrayList<Account> _AccountDetails = new ArrayList<>();

		try {

			
			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			// Declare the sql statement for retrieve all employee details
			// String _Sql = "select * from totalcountmonthlychart where Month= ' " +
			// monthNumber + " ' order by SumMsgCount desc LIMIT 20";
			String _Sql = "SELECT Month(Date) , sum(Msg_Count) FROM daily_sms_report.account where YEAR(Date) = '"
					+ year + "' group by MONTH(Date);";
		
			resultSet = statement.executeQuery(_Sql);

			if (resultSet.next()) {

				
				System.out.println("in in");

				do {
					// int id = resultSet.getInt(1);
					int _MonthNumber = resultSet.getInt(1);
					// String Date = resultSet.getString(3);
					int _MsgCount = resultSet.getInt(2);

					Account account = new Account(_MonthNumber, _MsgCount);

					_AccountDetails.add(account);

				} while (resultSet.next()); 
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return _AccountDetails;

	}

}
