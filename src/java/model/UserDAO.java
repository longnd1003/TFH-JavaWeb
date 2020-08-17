package model;

import entity.Admin;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dfsai
 */
public class UserDAO {

    DBContext db;

    public UserDAO() {
        db = new DBContext();
    }

    public ArrayList<User> getAllUsers() throws Exception {
        ArrayList<User> users = new ArrayList<>();
        String sql = "select * from UserData";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(8), rs.getString(7)));
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return users;
    }

    public Admin getAdmin(String username, String password) throws Exception {
        String sql = "select loginName, password from Admin where loginName=? and password=?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Admin(username, password);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return null;
    }

    public User getUser(String username, String password) throws Exception {
        String sql = "select * from UserData where loginName=? and password=?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(8), rs.getString(7));
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return null;
    }
    
    public boolean checkDuplicate(String username) throws Exception {
        String sql = "select admin.LoginName as 'admin', userdata.LoginName as 'user' from admin, userdata where admin.LoginName = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return false;
    }
    
    public void register(User user) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "insert into UserData(LoginName, Password, Email, FirstName, LastName, Phone, JoinDate) "
                + "values(?, ?, ?, N'" + user.getFirstName() + "', N'" + user.getLastName() + "', ?, getDate())";
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getLoginName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(null, ps, con);
        }
    }

}
