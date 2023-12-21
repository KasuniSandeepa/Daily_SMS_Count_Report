package Operations;
//import com.mobios.util.LogUtil;
//import lk.mobios.vibermessages.db.DBConnection;
//import lk.mobios.vibermessages.utils.CommonMethods;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

//import static lk.mobios.vibermessages.utils.Values.*;

@WebServlet(name = "/FileAnyUploader", urlPatterns = {"/FileAnyUploader"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,    // 10 MB
        maxFileSize = 1024 * 1024 * 50,        // 50 MB
        maxRequestSize = 1024 * 1024 * 100)    // 100 MB
public class FileUploader extends HttpServlet {


    private static final long serialVersionUID = 205242440643911308L;
    /**
     * Directory where uploaded files will be saved, its relative to
     * the web application directory.
     */

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        String fileName = null;


        try {
            // gets absolute path of the web application


            String fileTag = request.getParameter("fileTag");
            String action = ""+request.getParameter("action");

            // constructs path of the directory to save uploaded file
            String applicationPath = request.getServletContext().getRealPath("");
            System.out.println("fggfgfgfghhhhhhhhhhhhhhhhhhhhhhhhh");

            //linux
         //   String uploadFilePath = "/opt/apache-tomcat-8.5.11/webapps/TextwareDailySMSCount";
            //windows
            String uploadFilePath = applicationPath;

            // creates the save directory if it does not exists
            File fileSaveDir = new File(uploadFilePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
            System.out.println("Upload File Directory=" + fileSaveDir.getAbsolutePath());

            //Get all the parts from request and write it to the file on server
            for (Part part : request.getParts()) {
                if (part.getName().equals("fileAny")) {
                    fileName = getFileName(part);
                    part.write(uploadFilePath + File.separator + fileName);
                }
            }

            String path = uploadFilePath + File.separator + fileName;

            System.out.println(path);


            FileReader fileReader = new FileReader();
            LinkedHashMap<String,	Integer> hmap = FileReader.readData(path);
            
            Set<Map.Entry<String,Integer>> mySet = hmap.entrySet();
            String _date = request.getParameter("date");  
            
            for(Map.Entry<String,Integer> val : mySet){
            	
            	String accountName = val.getKey();
            	int msgCount = val.getValue();
            	
            	if(!(accountName.equals("Account Name") ||accountName.equals("SMS Count")) ){
            	
            	SMSdb insertData = new SMSdb();
            	insertData.InsertValue( accountName , msgCount ,  _date);}
            	
            }
           
            if(action.equals("reg")){
                response.setContentType("text/plain");
               // response.getWriter().print(s);
                return;
            }


        } catch (Exception ex) {
            System.out.println(ex + "sda");
            request.setAttribute("message", "FileError");
            getServletContext().getRequestDispatcher("/response.jsp").forward(
                    request, response);
            return;
        }

        request.setAttribute("message", fileName + " File uploaded successfully!");
        getServletContext().getRequestDispatcher("/index.jsp").forward(
                request, response);
        return;
    }

    /**
     * Utility method to get file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {

        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(" filename=\"");
        return tokens[1].split("\"")[0];
    }
}