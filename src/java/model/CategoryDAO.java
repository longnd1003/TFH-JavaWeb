package model;

import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dfsai
 */
public class CategoryDAO {
    
    DBContext db;
    
    public CategoryDAO() {
        db = new DBContext();
    }
    
    public ArrayList<Category> getAllCategories() throws Exception {
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "select * from categories";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                categoryList.add(new Category(rs.getInt("categoryId"), rs.getString("categoryName"), rs.getString("image"), rs.getString("addedDate")));
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return categoryList;
    }
    
    public Category getCategoryById(int id) throws Exception {
        Category category = null;
        String sql = "select * from categories where categoryid = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                category = new Category(rs.getInt("categoryId"), rs.getString("categoryName"), rs.getString("image"), rs.getString("addedDate"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return category;
    }
    
}
