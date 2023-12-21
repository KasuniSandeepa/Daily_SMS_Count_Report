package Operations;


import java.io.File;  
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;  
import org.apache.poi.ss.usermodel.Row;  
import org.apache.poi.xssf.usermodel.XSSFSheet;  
import org.apache.poi.xssf.usermodel.XSSFWorkbook;  

public class FileReader {
	
	
	
public static LinkedHashMap<String, Integer> readData(String path) {
	
	
	
	LinkedHashMap<String,Integer> hmap = new LinkedHashMap();
	String accountName = null;
	int  msgCount = 0;
	{  
		try  
		{  
		File file = new File(path);   //creating a new file instance  
		FileInputStream fis = new FileInputStream(file);   //obtaining bytes from the file  
		//creating Workbook instance that refers to .xlsx file  
		XSSFWorkbook wb = new XSSFWorkbook(fis);   
		XSSFSheet sheet = wb.getSheetAt(0);     //creating a Sheet object to retrieve object  
		Iterator<Row> itr = sheet.iterator();    //iterating over excel file  
		while (itr.hasNext())                 
		{  
		Row row = itr.next();  
		Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column  
		while (cellIterator.hasNext())   
		{  
		Cell cell = cellIterator.next();  
		switch (cell.getCellType())               
		{  
		case Cell.CELL_TYPE_STRING:    //field that represents string cell type //Prints Account Name 
			 accountName = cell.getStringCellValue();
		System.out.print(cell.getStringCellValue() + "\t\t\t");  
		break;  
		case Cell.CELL_TYPE_NUMERIC:    //field that represents number cell type  //Prints SMS Count
			
			 msgCount = (int) cell.getNumericCellValue();
		System.out.print(cell.getNumericCellValue() + "\t\t\t");  
		break;  
		default:  
		}
		
		hmap.put(accountName, msgCount);
		}  
		System.out.println("");  
		}  
		}  
		catch(Exception e)  
		{  
		e.printStackTrace();  
		}  
		
		
		
}
	return hmap;
}
}