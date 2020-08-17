package controller;

import entity.Category;
import entity.FoodItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryDAO;
import model.FoodItemDAO;

/**
 *
 * @author dfsai
 */
public class EditItemServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditItemServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditItemServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            String catId = request.getParameter("catId");
            FoodItemDAO fdb = new FoodItemDAO();
            FoodItem food = fdb.getItemsById(itemId);
            request.setAttribute("food", food);
            CategoryDAO cdb = new CategoryDAO();
            ArrayList<Category> categoryList = cdb.getAllCategories();
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("control/editItem.jsp?itemId=" + itemId + "&catId=" + catId).forward(request, response);
        } catch (Exception ex) {
            request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
            Logger.getLogger(EditItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            String rawItemId = request.getParameter("itemId");
            String foodName = request.getParameter("foodName");
            String rawPrice = request.getParameter("price");
            String rawCatId = request.getParameter("categoryId");
            int price = Integer.parseInt(rawPrice);
            int catId = Integer.parseInt(rawCatId);
            int itemId = Integer.parseInt(rawItemId);
            String image = request.getParameter("image");
            FoodItemDAO fdb = new FoodItemDAO();
            fdb.editItem(itemId, foodName, price, catId, image);
            response.sendRedirect("/control");
        } catch (Exception ex) {
            request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
            Logger.getLogger(EditItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
