package modle;

public class Data_Year {
	
	int  monthNumber;
	int msgCount;
	
	public Data_Year(int monthNumber, int msgCount) {
		super();
		this.monthNumber = monthNumber;
		this.msgCount = msgCount;
	}

	public int getMonthNumber() {
		return monthNumber;
	}

	public void setMonthNumber(int monthNumber) {
		this.monthNumber = monthNumber;
	}

	public int getMsgCount() {
		return msgCount;
	}

	public void setMsgCount(int msgCount) {
		this.msgCount = msgCount;
	}
	
	

}
