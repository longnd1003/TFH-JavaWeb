package model;

import entity.Restaurant;
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
public class RestaurantDAO {

    DBContext db;

    public RestaurantDAO() {
        db = new DBContext();
    }

    public ArrayList<Restaurant> getRestaurants() throws Exception {
        ArrayList<Restaurant> restaurants = new ArrayList<>();
        String sql = "select * from Restaurant";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                restaurants.add(new Restaurant(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }
        } catch (Exception ex) {
            Logger.getLogger(RestaurantDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return restaurants;
    }

    public ArrayList<Restaurant> searchRestaurantByName(String name) throws Exception {
        ArrayList<Restaurant> resList = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Restaurant WHERE RestaurantName LIKE N'%' + ? + '%'";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                resList.add(new Restaurant(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }
        } catch (Exception ex) {
            Logger.getLogger(RestaurantDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return resList;
    }

}
