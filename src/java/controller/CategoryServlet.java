package controller;

import entity.Category;
import entity.FoodItem;
import java.io.IOException;
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
public class CategoryServlet extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ListComboServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ListComboServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
            FoodItemDAO fdb = new FoodItemDAO();
            String rawId = request.getParameter("id");
            String rawStart = request.getParameter("s");
            String rawEnd = request.getParameter("e");
            int catId;
            try {
                catId = Integer.parseInt(rawId);
            } catch (Exception ex) {
                catId = 1;
            }
            ArrayList<FoodItem> itemList;
            ArrayList<FoodItem> pagination;
            try {
                itemList = fdb.getItemsByCatId(catId);
            } catch (Exception ex) {
                itemList = new ArrayList<>();
            }
            try {
                int start = 0;
                int end = 6;
                if (itemList.size() < end) {
                    end = itemList.size();
                }
                if (rawStart != null) {
                    start = Integer.parseInt(rawStart);
                }
                if (rawEnd != null) {
                    end = Integer.parseInt(rawEnd);
                }
                pagination = fdb.getListByPage(itemList, start, end);
            } catch (Exception ex) {
                pagination = new ArrayList<>();
            }
            Category category;
            try {
                CategoryDAO cdb = new CategoryDAO();
                category = cdb.getCategoryById(catId);
            } catch (Exception ex) {
                category = new Category();
            }
            Integer numOfPage = itemList.size() / 6;
            if ((numOfPage * 6) < itemList.size()) {
                numOfPage++;
            }
            request.setAttribute("numOfPage", numOfPage);
            request.setAttribute("fullItems", itemList);
            request.setAttribute("pagination", pagination);
            request.setAttribute("category", category);
            request.getRequestDispatcher("category.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
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
        processRequest(request, response);
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
