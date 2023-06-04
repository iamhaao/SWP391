package Controller;

import DAO.AccountDB;
import DAO.OrderDB;
import DAO.ProductDB;
import Models.Account;
import Models.Cart;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ACER NITRO
 */
public class ShoppingCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDB pdb = new ProductDB();
        HttpSession session = request.getSession();
        ArrayList<Cart> list = null;
        list = (ArrayList<Cart>) session.getAttribute("cart_list");
        ArrayList<Cart> cartProducts = (ArrayList<Cart>) pdb.getCartProducts(list);
        session.setAttribute("cartProducts", cartProducts);
        Account acc = (Account) session.getAttribute("acc");
        OrderDB odb = new OrderDB();
        AccountDB adb=new AccountDB();
        double totalOrder = odb.getTotalOrder(acc.getIdAccount());
        int royal=0;
        double discount=0;
        if(totalOrder<500000){
            royal=1;
        }else if(totalOrder>500000&&totalOrder<2000000){
            royal=2;
        } else if(totalOrder>2000000&&totalOrder<5000000){
            royal=3;
        } else if(totalOrder>5000000){
            royal=4;
        }
        acc.setRoyal(royal);
        adb.updateRoyal(acc.getIdAccount(),acc.getRoyal());
        if (list == null) {
            request.setAttribute("alert", "Your cart is null,comebake to Shopping ");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } else {
            double price = 0;
            try {
                price = pdb.getTotalMoney(list);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
            if (price > 200000) {
                session.setAttribute("ship", "Free");
            } else {
                double ship = (price * 5) / 100;
                session.setAttribute("ship", ship);
                price = price + ship;
            }
         
            switch (acc.getRoyal()) {
                case 1:
                    discount=0;
                    break;
                case 2:
                    discount=(price * 5) / 100;
                    break;
                case 3:
                    discount=(price * 10) / 100;
                    break;
                case 4:
                    discount=(price * 20) / 100;
                    break;
            }
            price=price-discount;
            session.setAttribute("disscount", discount);
            session.setAttribute("total", price);
            response.sendRedirect("Cart.jsp");
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
