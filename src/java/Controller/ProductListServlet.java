package Controller;

import DAO.CatogeryDB;
import DAO.ProductDB;
import Models.Catogery;
import Models.Product;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import java.util.List;

public class ProductListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("nameSearch");
        int type =Integer.parseInt(request.getParameter("choose"));
        ProductDB pdb = new ProductDB();
        CatogeryDB cdb = new CatogeryDB();
        List<Catogery> categorys = cdb.getAll();
        List<Product> products =new ArrayList<>();
        if (!name.isEmpty()) {
            products = pdb.getProductByName(name);
            request.setAttribute("products", products);
            request.getRequestDispatcher("Product.jsp").forward(request, response);
        } else {
            products=pdb.getProductByType(type);
////            String tp = cdb.getCatoryById(type);
//            request.setAttribute("type", tp);
            request.setAttribute("products", products);
            request.setAttribute("categorys", categorys);
            request.getRequestDispatcher("Product.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
