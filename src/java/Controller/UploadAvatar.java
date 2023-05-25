
package Controller;

import DAO.AccountDB;
import Models.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

import java.util.UUID;


@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class UploadAvatar extends HttpServlet{
    
        private String uploadImage(String param, HttpServletRequest request) throws IOException, ServletException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String filename;
            try {
            Part part = request.getPart(param);
            filename = part.getSubmittedFileName();
            if (filename.isEmpty()) {
                return null;
            }
            String uniname = UUID.randomUUID() + "_" + part;
            part.write(uploadPath + File.separator + uniname);
            return uniname;
        
            } catch (Exception ex) {
            ex.printStackTrace();
            return null;
            }
            
    }

         protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           HttpSession session=request.getSession();
           String image = "./images/" + uploadImage("image", request);
           Account acc=(Account) session.getAttribute("acc");
           String username=acc.getUsername();
           AccountDB adb=new AccountDB();
           adb.updateImg(acc.getUsername(),image);
           session.removeAttribute("acc");
           Account acc1=adb.getAccountByUsername(username);
           acc1.getAvatar();
           session.setAttribute("acc", acc1);
           response.sendRedirect("profile");
         };

   
}
