/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.servlet.http.HttpSession;
import model.CategoryDAO;
import model.FoodItemDAO;

/**
 *
 * @author Kaz
 */
public class HomeServlet extends HttpServlet {

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
        try {
            HttpSession session = request.getSession(true);
            FoodItemDAO fdb = new FoodItemDAO();
            ArrayList<FoodItem> newItems;
            try {
                newItems = fdb.getItemsByDate();
            } catch (Exception ex) {
                newItems = new ArrayList<>();
            }
            request.setAttribute("newItems", newItems);
            CategoryDAO cdb = new CategoryDAO();
            ArrayList<Category> categoryList;
            try {
                categoryList = cdb.getAllCategories();
            } catch (Exception ex) {
                categoryList = new ArrayList<>();
            }
            session.setAttribute("cats", categoryList);
            ArrayList<FoodItem> hotItems;
            try {
                hotItems = fdb.getHotItems();
            } catch (Exception ex) {
                hotItems = new ArrayList<>();
            }
            request.setAttribute("hotItems", hotItems);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception ex) {
            request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
