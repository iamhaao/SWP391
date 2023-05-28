
package Controller.Shipper;

import DAO.OrderDB;
import DAO.OrderManageDB;
import Models.Account;
import Models.OrderManage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;


public class ChangeStatusOrderServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("id");
        int status=Integer.parseInt(request.getParameter("status"));
        OrderDB odb=new OrderDB();
        odb.updateStatus(status,id);
        OrderManageDB omdb=new OrderManageDB();
        HttpSession session=request.getSession();
        Account acc=(Account) session.getAttribute("acc");
        List<OrderManage> listOrder=omdb.getOrderByShipper(acc.getIdAccount());
        request.setAttribute("listByShipper", listOrder);
        request.getRequestDispatcher("ManageDelivery.jsp").forward(request, response);
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
