package Database;
import java.sql.DriverManager;
import com.mysql.jdbc.Connection;

public class DBConnection {

		//private static String Url = "jdbc:mysql://localhost:3306/daily_sms_report?autoReconnect=true&allowLoadLocalInfile=true&allowMultiQueries=true&useUnicode=yes&characterEncoding=UTF-8";
	//private static String Url = "jdbc:mysql://localhost:3306/daily_sms_report";	
	//private static String Url = "jdbc:mysql://localhost:3306/daily_sms_report?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static String Url = "jdbc:mysql://localhost:3306/daily_sms_report?useSSL=false&allowPublicKeyRetrieval=true";
	//  private String dbName = "drug_db?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static String UserName = "root";
	private static String Password = "kasuni123*";
	//private static String Password = "Mobios@#1";

	//	private static String Password = "Nx2mD5RD2waHg8V";

		private static Connection Connect;

		public static Connection GetConnection() {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				//Class.forName("com.mysql.cj.jdbc.Driver");

				Connect = (Connection) DriverManager.getConnection(Url,UserName, Password);
				System.out.println("Database Connection is Success");

			} catch (Exception e) {

				System.out.println("Database connection is not success");
				e.printStackTrace();
				
			}

			return Connect;

		}

}



