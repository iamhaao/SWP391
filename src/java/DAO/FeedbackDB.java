/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import Models.Feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class FeedbackDB  extends DBContext {
    public List<Feedback> getAllFeedback(int productId) {
        List<Feedback> listFeedback = new ArrayList<>();
        String sql = "select * from Feedback where ProductID =? order by date desc";
        
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
                listFeedback.add(fb);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listFeedback;
    }

    ;
    public void addFeedback(Feedback fb) {
        String sql = "insert into Feedback (AccountID, ProductID, scrip, date, rating) \n" +
        "values(?, ?, ?,GETDATE(),?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1,fb.getAccountID() );
            stmt.setInt(2, fb.getProductID());
            stmt.setString(3, fb.getScript());
            stmt.setInt(4,fb.getRating());
            stmt.executeUpdate();
        } catch (Exception e) {
        }
    }
     public int avgRating(int productId) {

               String sql = "select AVG(Feedback.rating) from OrderDetails\n" +
                            "join Feedback\n" +
                            "on Feedback.ProductID = OrderDetails.ProductID\n" +
                            "where  OrderDetails.ProductID =? ";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
             stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
                       
            }
        } catch (Exception e) {

        }
        return 0;
    }
       public static void main(String[] args) {
 
            FeedbackDB dao = new FeedbackDB();
            Feedback fb = new Feedback(3, 7,"testrating",3);
            dao.addFeedback(fb);
            
            System.out.println( dao.avgRating(15));
//            List<Feedback> list = dao.getAllFeedback(6);
//                    for(Feedback o : list){
//                        System.out.println(o);
//                    }
             

         }  
}
