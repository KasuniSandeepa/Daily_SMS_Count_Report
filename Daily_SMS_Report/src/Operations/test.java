package Operations;

import java.util.ArrayList;
import java.util.List;

import modle.testss;

public class test {
	
	
	public static void main(String[] args) {
		
		
		
		List<String> dates = new ArrayList<>();
		List<testss> rowData = new ArrayList<>();
		
		
		dates.add("2020-03-02");
		dates.add("2020-03-03");
		
		
	
		
		dates.forEach(d->{
			
			//while
			
			if(d.equals("2020-02-01") ){
				
					if(rowData.isEmpty()) {
						List<Integer> dateCount = new ArrayList<>();
						dateCount.add(10);
						rowData.add(new testss("rrs name", dateCount));
						
					}else {
						
						rowData.forEach(r->{
							
							
						});
					}
			
		}
			
			
		});
		
		
	}
}
