import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 56177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/highconnect";
    private String dbUser = "root";
    private String dbPass = "admin";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    	
        HttpSession session=request.getSession();
       String frndemail=(String)session.getAttribute("frndemail");
       System.out.println("frnd email is "+frndemail);
       
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
      
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
        	 
              
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
           
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            
        }           
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        int i=1;
        int v;
        try
        {
        	      	
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
           // String sql = "insert into photoadd(photo,email) values(?,?)";
            //PreparedStatement statement = conn.prepareStatement(sql);     
            if(frndemail!=null)
            {
            String sqll = "insert into photoadd(photo,email) values(?,?)";
            PreparedStatement statement1 = conn.prepareStatement(sqll); 
        
            if (inputStream != null) {
            // fetches input stream of the upload file for the blob columnSystem.out.println(i);
            statement1.setBlob(1, inputStream);
            statement1.setString(2,frndemail);}
            v=statement1.executeUpdate();
            if(v>0)
            {
            	System.out.println("frnds is "+v);
            	 message = "Photo uploaded and saved into database";
            }
            else
            {System.out.println(++i);
        	message="Photo is not uploaded";
            }
            }
         }
        catch (SQLException ex) {
    	
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {System.out.println(++i);
                // closes the database connection
                try {
                    conn.close();System.out.println(++i);
                } catch (SQLException ex) {System.out.println(++i);
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);System.out.println(++i);
             
            // forwards to the message page
          getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        }
    }
}