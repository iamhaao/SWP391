package DAO;

import Models.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDB extends DBContext {

    public List<Account> getAll() {
        List<Account> listAccount = new ArrayList<>();
        String sql = "select * from Account";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Account acc = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getInt(10));
                listAccount.add(acc);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listAccount;
    }

    ;
    
    public Account getAccountByUsername(String username) {
        Account acc = new Account();
        String sql = "select * from Account where Username=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                acc.setIdAccount(rs.getInt(1));
                acc.setUsername(rs.getString(2));
                acc.setPassword(rs.getString(3));
                acc.setName(rs.getString(4));
                acc.setEmail(rs.getString(5));
                acc.setAddress(rs.getString(6));
                acc.setPhone(rs.getString(7));
                acc.setIdRole(rs.getInt(8));
                acc.setAvatar(rs.getString(9));
                acc.setActive(rs.getInt(10));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return acc;
    }
        public Account getAccountByEmail(String Email) {
        Account acc = new Account();
        String sql = "select * from Account where Email =?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, Email);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                acc.setIdAccount(rs.getInt(1));
                acc.setUsername(rs.getString(2));
                acc.setPassword(rs.getString(3));
                acc.setName(rs.getString(4));
                acc.setEmail(rs.getString(5));
                acc.setAddress(rs.getString(6));
                acc.setPhone(rs.getString(7));
                acc.setIdRole(rs.getInt(8));
                acc.setAvatar(rs.getString(9));
                acc.setActive(rs.getInt(10));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return acc;
    }
    ;


    public void updateCustomer(Account c) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [Username] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Address] =?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[roleId] = ?\n"
                + "      ,[avatar] = ?\n"
                + "      ,[active] = ?\n"
                + " WHERE Username=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, c.getUsername());
            stmt.setString(2, c.getPassword());
            stmt.setString(3, c.getName());
            stmt.setString(4, c.getEmail());
            stmt.setString(5, c.getAddress());
            stmt.setString(6, c.getPhone());
            stmt.setInt(7, c.getIdRole());
            stmt.setString(8, c.getAvatar());
            stmt.setInt(9, c.getActive());
            stmt.setString(10, c.getUsername());
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean checkSignUp(String username) {
        boolean result = false;
        String sql = "select * from Account where Username=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public void addAccount(Account acc) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[name]\n"
                + "           ,[Email]\n"
                + "           ,[Address]\n"
                + "           ,[Phone]\n"
                + "           ,[roleId]\n"
                + "           ,[avatar]"
                + "            ,[active])\n"
                + "     VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, acc.getUsername());
            stmt.setString(2, acc.getPassword());
            stmt.setString(3, acc.getName());
            stmt.setString(4, acc.getEmail());
            stmt.setString(5, acc.getAddress());
            stmt.setString(6, acc.getPhone());
            stmt.setInt(7, acc.getIdRole());
            stmt.setString(8, acc.getAvatar());
            stmt.setInt(9, 1);
            stmt.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account getAccountByOrderID(String id) {
        Account acc = new Account();
        String sql = "select a.AccountID,a.Username,a.Password,a.Phone,a.name,a.Email,a.Address,a.roleId,a.avatar from Account a,Orders o where a.AccountID=o.AccountID and o.OrderID=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                acc.setIdAccount(rs.getInt(1));
                acc.setUsername(rs.getString(2));
                acc.setPassword(rs.getString(3));
                acc.setName(rs.getString(4));
                acc.setEmail(rs.getString(5));
                acc.setAddress(rs.getString(6));
                acc.setPhone(rs.getString(7));
                acc.setIdRole(rs.getInt(8));
                acc.setAvatar(rs.getString(9));
                acc.setActive(rs.getInt(10));
            }
        } catch (Exception e) {
        }

        return acc;
    }
     public void updateCustomerByEmail(String email, String pass) {
        String sql = "update Account set Password=? where Email=? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, pass);
            stmt.setString(2, email);
            stmt.executeUpdate();
            
        } catch (SQLException e) {
        }
    }
    public Account getAccountByID(int id) {
        Account acc = new Account();
        String sql = "select * from Account where AccountID=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                acc.setIdAccount(id);
                acc.setUsername(rs.getString(2));
                acc.setPassword(rs.getString(3));
                acc.setName(rs.getString(4));
                acc.setEmail(rs.getString(5));
                acc.setAddress(rs.getString(6));
                acc.setPhone(rs.getString(7));
                acc.setIdRole(rs.getInt(8));
                acc.setAvatar(rs.getString(9));
                acc.setActive(rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return acc;
    }
public boolean isAccountByEmail(String email) {
       boolean result = false;
        String sql = "select * from Account where Email=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    ;
    ;


    public void updateImg(String username, String image) {
        String sql = "Update Account SET avatar=? where Username=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, image);
            stmt.setString(2, username);
            stmt.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void block(String username) {
        String sql = "Update Account set active=? where Username=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, 0);
            stmt.setString(2, username);
            stmt.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePass(String username, String newpass) {
        String sql = "Update Account set Password=? where Username=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, newpass);
            stmt.setString(2, username);
            stmt.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void addAccountLoginWithGoogle(Account acc) {
        String sql = "INSERT INTO [dbo].[Account]\n" +
"           ([Username]\n" +
"           ,[Email]\n" +
"           ,[roleId]\n" +
"           ,[avatar]\n" +
"           ,[active])\n" +
"     VALUES(?,?,?,?,?);";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,acc.getUsername() );
            stmt.setString(2, acc.getEmail());
            stmt.setInt(3, 2);
            stmt.setString(4,acc.getAvatar());
            stmt.setInt(5, 1);
            stmt.executeUpdate();
        } catch (Exception e) {
        }
    }
   
        public static void main(String[] args) {
            AccountDB adb = new AccountDB();
//            Account acc = new Account("testlogin", "testlogin@gmail.com");
//           adb.addAccountLoginWithGoogle(acc);
             Account acc = adb.getAccountByEmail("trinhltnde160563@gmail.com");
            System.out.println(adb.isAccountByEmail("haolee2002tst@gmail.com"));
        }
}
