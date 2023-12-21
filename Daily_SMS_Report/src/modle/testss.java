package modle;

import java.util.List;

public class testss {
	
	String name;
	List<Integer> dateCount;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Integer> getDateCount() {
		return dateCount;
	}
	public void setDateCount(List<Integer> dateCount) {
		this.dateCount = dateCount;
	}
	public testss(String name, List<Integer> dateCount) {
		super();
		this.name = name;
		this.dateCount = dateCount;
	}
	
	

}
