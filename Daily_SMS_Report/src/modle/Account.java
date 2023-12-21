package modle;

public class Account {
	
	private int Id;
	private String AccountName;
	private String Date;
	private int month;
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
		}
	public Account(int month, int msgCount) {
		super();
		this.month = month;
		MsgCount = msgCount;
	}
	private int MsgCount;
	
	
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getAccountName() {
		return AccountName;
	}
	public void setAccountName(String accountName) {
		AccountName = accountName;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public int getMsgCount() {
		return MsgCount;
	}
	public void setMsgCount(int msgCount) {
		MsgCount = msgCount;
	}
	
	public Account(int id, String accountName, String date, int msgCount) {
		super();
		Id = id;
		AccountName = accountName;
		Date = date;
		MsgCount = msgCount;
	}
	public Account() {
		super();
		
	}
	public Account(int id2, String accountName2, String date2) {
		// TODO Auto-generated constructor stub
	}
	public Account(String accountName2, int msgCount2) {
		
		this.AccountName = accountName2;
		this.MsgCount = msgCount2;
		// TODO Auto-generated constructor stub
	}
	
	public void Account1(String date, int msgCount2) {
		
		this.Date =  date;
		this.MsgCount = msgCount2;
		// TODO Auto-generated constructor stub
	}
	
	public Account(String name, String date , int count) {
		
		this.AccountName = name;
		this.Date =  date;
		this.MsgCount = count;
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Account [Id=" + Id + ", AccountName=" + AccountName + ", Date=" + Date + ", MsgCount=" + MsgCount + "]";
	}
	
	
	
  
	
	
	

}
