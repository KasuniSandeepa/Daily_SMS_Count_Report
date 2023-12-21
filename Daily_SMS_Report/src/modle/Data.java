package modle;

public class Data {

	 String name;
	 String count;
	 String date;
	 
	 
	public Data(String name, String count) {
		super();
		this.name = name;
		this.count = count;
	}

	

	public Data(String name, String count, String date) {
		super();
		this.name = name;
		this.count = count;
		this.date = date;
	}



	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCount() {
		return count;
	}


	public void setCount(String count) {
		this.count = count;
	}
	
	

	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	@Override
    public String toString() {
        return "Data{" +
                "name='" + name + '\'' +
                ", count='" + count + '\'' +
                  ", date='" + date + '\'' +
                
                '}';
    }
	
	
	 
}
