/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luiza
 */
@WebServlet(name = "MathServlet", urlPatterns = {"/math-servlet.html"})
public class MathServlet extends HttpServlet {

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
            out.println("<title>Servlet OperacoesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h4>Opeações Aritméticas</h4>");
            
            try {
                int op = Integer.parseInt(request.getParameter("op"));
                int n2 = Integer.parseInt(request.getParameter("n2"));
                int n1 = Integer.parseInt(request.getParameter("n1"));
                
                if(op == 1){
                    out.println("<p> A soma de " + n1 + " mais " + n2 + " é " + (n1+n2) + ".</p>");
                } else if(op == 2){
                    out.println("<p> A subtração de " + n1 + " menos " + n2 + " é " + (n1-n2) + ".</p>");
                } else if(op == 3){
                    out.println("<p> A multiplicação de " + n1 + " vezes " + n2 + " é " + (n1*n2) + ".</p>");
                } else if(op == 4){
                    out.println("<p> A divisão de " + n1 + " por " + n2 + " é " + (n1/n2) + ".</p>");
                }
                
            } catch(Exception ex) {
                out.println("<p stype = 'color:red'>"+ex.getMessage()+"</p>");
            }
            out.println("<a href = 'index.html'> Voltar </a>");
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
