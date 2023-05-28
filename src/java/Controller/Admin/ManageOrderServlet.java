
package Controller.Admin;

import DAO.OrderManageDB;
import Models.OrderManage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


public class ManageOrderServlet extends HttpServlet {

    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderManageDB omdb=new OrderManageDB();
        List<OrderManage> list=omdb.getAll();
        request.setAttribute("manageOrder", list);
        request.getRequestDispatcher("ManagerOrder.jsp").forward(request, response);       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
