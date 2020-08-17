package model;

import entity.Category;
import entity.FoodItem;
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
public class FoodItemDAO {

    DBContext db;

    public FoodItemDAO() {
        db = new DBContext();
    }

    public ArrayList<FoodItem> getAllItems() throws Exception {
        ArrayList<FoodItem> foodList = new ArrayList<>();
        String sql = "select foodid, foodname, price, fooditems.categoryid, categoryname, "
                + "Categories.AddedDate as catAddedDate, fooditems.AddedDate as faddDate, "
                + "fooditems.image from Categories, FoodItems "
                + "where FoodItems.CategoryID = Categories.CategoryID";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                FoodItem item = new FoodItem();
                item.setFoodId(rs.getInt(1));
                item.setFoodName(rs.getString(2));
                item.setPrice(rs.getInt(3));
                Category category = new Category();
                category.setCategoryId(rs.getInt(4));
                category.setCategoryName(rs.getString(5));
                category.setAddedDate(rs.getString(6));
                item.setCategory(category);
                item.setAddedDate(rs.getString(7));
                item.setImage(rs.getString(8));
                foodList.add(item);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return foodList;
    }

    public FoodItem getItemsById(int id) throws Exception {
        String sql = "select foodid, foodname, price, fooditems.categoryid, categoryname, "
                + "Categories.AddedDate as catAddedDate, fooditems.AddedDate as faddDate, "
                + "fooditems.image from Categories, FoodItems "
                + "where FoodItems.CategoryID = Categories.CategoryID "
                + "and foodid = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                FoodItem item = new FoodItem();
                item.setFoodId(rs.getInt(1));
                item.setFoodName(rs.getString(2));
                item.setPrice(rs.getInt(3));
                Category category = new Category();
                category.setCategoryId(rs.getInt(4));
                category.setCategoryName(rs.getString(5));
                category.setAddedDate(rs.getString(6));
                item.setCategory(category);
                item.setAddedDate(rs.getString(7));
                item.setImage(rs.getString(8));
                return item;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return null;
    }

    public ArrayList<FoodItem> getItemsByCatId(int catId) throws Exception {
        ArrayList<FoodItem> foodList = new ArrayList<>();
        String sql = "select foodid, foodname, price, fooditems.categoryid, categoryname, "
                + "Categories.AddedDate as catAddedDate, fooditems.AddedDate as faddDate, "
                + "fooditems.image from Categories, FoodItems "
                + "where FoodItems.CategoryID = Categories.CategoryID "
                + "and Categories.CategoryID = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, catId);
            rs = ps.executeQuery();
            while (rs.next()) {
                FoodItem item = new FoodItem();
                item.setFoodId(rs.getInt(1));
                item.setFoodName(rs.getString(2));
                item.setPrice(rs.getInt(3));
                Category category = new Category();
                category.setCategoryId(rs.getInt(4));
                category.setCategoryName(rs.getString(5));
                category.setAddedDate(rs.getString(6));
                item.setCategory(category);
                item.setAddedDate(rs.getString(7));
                item.setImage(rs.getString(8));
                foodList.add(item);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return foodList;
    }

    public ArrayList<FoodItem> getItemsByDate() throws Exception {
        ArrayList<FoodItem> foodList = new ArrayList<>();
        String sql = "select top 6 * from FoodItems order by AddedDate desc";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                FoodItem item = new FoodItem();
                item.setFoodName(rs.getString("FoodName"));
                item.setPrice(rs.getInt("Price"));
                item.setImage(rs.getString("Image"));
                foodList.add(item);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return foodList;
    }

    public ArrayList<FoodItem> getHotItems() throws Exception {
        ArrayList<FoodItem> foodList = new ArrayList<>();
        String sql = "select top 6 foodname, fooditems.price, image, count(orderid) as count from "
                + "FoodItems left join OrderDetail on FoodItems.FoodID = OrderDetail.FoodID "
                + "group by foodname, fooditems.price, image order by count desc";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                FoodItem item = new FoodItem();
                item.setFoodName(rs.getString("foodname"));
                item.setPrice(rs.getInt("price"));
                item.setFoodId(rs.getInt("count"));
                item.setImage(rs.getString("image"));
                foodList.add(item);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return foodList;
    }

    public ArrayList<FoodItem> getListByPage(ArrayList<FoodItem> items, int start, int end) {
        ArrayList<FoodItem> page = new ArrayList<>();
        for (int i = start; i < end; i++) {
            page.add(items.get(i));
        }
        return page;
    }

    public void addItem(String foodName, int price, int categoryId, String image) throws Exception {
        String sql = "insert into FoodItems(FoodName, Price, CategoryID, AddedDate, Image) values(N'" + foodName + "', ?, ?, getDate(), ?)";
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, price);
            ps.setInt(2, categoryId);
            ps.setString(3, image);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(FoodItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(null, ps, con);
        }
    }

    public ArrayList<FoodItem> getItemsByName(String name) throws Exception {
        ArrayList<FoodItem> itemList = new ArrayList<>();
        String sql = "SELECT f.FoodID,f.FoodName,f.Price,f.CategoryID, c.CategoryName, c.AddedDate, f.AddedDate, f.Image \n"
                + "FROM dbo.FoodItems f JOIN dbo.Categories c ON c.CategoryID = f.CategoryID WHERE f.FoodName LIKE N'%' + ? + '%'";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                FoodItem item = new FoodItem();
                item.setFoodId(rs.getInt(1));
                item.setFoodName(rs.getString(2));
                item.setPrice(rs.getInt(3));
                Category category = new Category();
                category.setCategoryId(rs.getInt(4));
                category.setCategoryName(rs.getString(5));
                category.setAddedDate(rs.getString(6));
                item.setCategory(category);
                item.setAddedDate(rs.getString(7));
                item.setImage(rs.getString(8));
                itemList.add(item);
            }
        } catch (Exception ex) {
            Logger.getLogger(FoodItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(rs, ps, con);
        }
        return itemList;
    }

    public void editItem(int id, String foodName, int price, int categoryId, String image) throws Exception {
        String sql = "update FoodItems set FoodName=?, Price=?, CategoryID=?, AddedDate=getDate(), Image=? where FoodId=?";
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, foodName);
            ps.setInt(2, price);
            ps.setInt(3, categoryId);
            ps.setString(4, image);
            ps.setInt(5, id);
            ps.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(FoodItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(null, ps, con);
        }
    }

    public void removeItem(int id) throws Exception {
        String sql = "delete from FoodItems where foodid = ?";
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(FoodItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            db.closeConnection(null, ps, con);
        }
    }

}
