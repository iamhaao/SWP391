
package Controller.Admin;

import DAO.CatogeryDB;
import DAO.ProductDB;
import Models.Catogery;
import Models.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(name = "ManageProduct", urlPatterns = {"/manageProduct"})
public class ManageProduct extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDB pdb=new ProductDB();
        List<Product> listProduct=pdb.getAll();
        CatogeryDB cdb=new CatogeryDB();
        List<Catogery> listCtg=cdb.getAll();
        int size=listProduct.size();
        request.setAttribute("size", size);
        request.setAttribute("listCatogery", listCtg);
        request.setAttribute("listProducts", listProduct);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String name=request.getParameter("name");
        int catogery=Integer.parseInt(request.getParameter("catogery"));
        double price=Double.parseDouble(request.getParameter("price"));
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        String description=request.getParameter("description");
        String image="./images/" + uploadImage("image", request);
        Product p=new Product(1, name,description, price, image, catogery, quantity, formatter.format(date));
        ProductDB pdb=new ProductDB();
        pdb.addProduct(p); 
        response.sendRedirect("manageProduct");
                
                    
    }


private String uploadImage(String param, HttpServletRequest request) throws IOException, ServletException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String filename;
            
            Part part = request.getPart(param);
            filename = part.getSubmittedFileName();
            if (filename.isEmpty()) {
                return null;
            }
            String uniname = UUID.randomUUID() + "_" + part;
            part.write(uploadPath + File.separator + uniname);
            return uniname;
                  
    }
}
