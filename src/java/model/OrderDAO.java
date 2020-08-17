package model;

import entity.OrderDetail;
import entity.OrderList;
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
public class OrderDAO {
    
    DBContext db;

    public OrderDAO() {
        db = new DBContext();
    }

    public ArrayList<OrderList> getAllOrders() throws Exception {
        ArrayList<OrderList> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.OrderList";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderList(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return list;
    }
    
    public int getOrderId(int customerId) throws Exception {
        String sql = "select orderid from orderlist where customerid = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return -1;
    }

    public void createOrder(int userId) throws Exception {
        String sql = "INSERT INTO dbo.OrderList(CustomerID, OrderDate)"
                + "VALUES(?, getdate())";
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(null, ps, con);
        }
    }
    
    public void createOrderDetail(OrderDetail orderDetail, int orderId) throws Exception {
        String sql = "INSERT INTO dbo.OrderDetail(orderid, foodid, price, deliveryaddress, quantity)"
                + "VALUES(?, ?, ?, ?, ?)";
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.setInt(2, orderDetail.getFoodId());
            ps.setInt(3, orderDetail.getPrice());
            ps.setString(4, orderDetail.getDeliveryAddress());
            ps.setInt(5, orderDetail.getQuantity());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(null, ps, con);
        }
    }
}
