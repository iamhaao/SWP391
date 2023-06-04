
package Controller.Admin;

import DAO.OrderDB;
import Models.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;


public class ConfirmOrderServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String orderID=request.getParameter("id");
       int status=Integer.parseInt(request.getParameter("status"));
       OrderDB odb=new OrderDB();
       odb.updateStatus(status,orderID);
        HttpSession session=request.getSession();
       List<Order> listOrderConfirm=odb.getListConfirm();
        int sizeConfirm=listOrderConfirm.size();
        session.setAttribute("sizeConfirm", sizeConfirm);
        session.setAttribute("listConfirm", listOrderConfirm);
        request.getRequestDispatcher("ConfirmOrder.jsp").forward(request, response);
    }



}
