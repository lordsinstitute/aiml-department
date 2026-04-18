/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ErasureCode;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Java
 */
public class UserRegistrationForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    static Properties properties = new Properties();
   static
   {
      properties.put("mail.smtp.host", "smtp.gmail.com");
      properties.put("mail.smtp.socketFactory.port", "465");
      properties.put("mail.smtp.socketFactory.class",
                     "javax.net.ssl.SSLSocketFactory");
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.port", "465");
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserRegistrationForm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserRegistrationForm at " + request.getContextPath() + "</h1>");
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
          HttpSession session1=request.getSession();
            Connection con=null;
            Statement st=null;
            ResultSet rs1=null;
            
        try
        {
            String reguser=request.getParameter("name");
              String regpws=request.getParameter("password");
            String regemail=request.getParameter("email");
            String regpno=request.getParameter("mobileno");
              String Key=request.getParameter("Key");
              session1.setAttribute("regemail", regemail);
          String gender="male";
            
            
            System.out.println("name"+reguser);
            System.out.println("pws"+regpws);
            System.out.println("mobileno"+regpno);
            System.out.println("mail"+regemail);
             System.out.println("Key"+Key);
            
            
            
             Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erasurecode","root","password");
          st=con.createStatement();
          
           int rs=st.executeUpdate("Insert into registration(username,password,gender,email,phoneno,userproductkey) VALUES('"+reguser+"','"+regpws+"','"+gender+"','"+regemail+"','"+regpno+"','"+Key+"')");
           
          if(rs>0)
           { 
            response.sendRedirect("index.jsp");
            
           }
          else
          {
              RequestDispatcher rd=request.getRequestDispatcher("UserReg.jsp");  
        rd.include(request, response); 
         out.print("<br><br><br><h1><center>Sorry UserName or Password Error!"+"</h1>");
          }
          
            
          
          
        final String  from="hariraman692@gmail.com;
      final String password="hariram3118";
      Session session = Session.getInstance(properties, new javax.mail.Authenticator() 
         {
            protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, password);
            }});
         Message message = new MimeMessage(session);
         message.setFrom(new InternetAddress(from));
         message.setRecipients(Message.RecipientType.TO, 
         InternetAddress.parse(regemail));
         message.setSubject("Sharing Key");
         //message.setSubject("private key");
         
         
         
         message.setText("Buddy Your Key is"+"\n"+Key + "\n");
         //message.setText("private key is "+"\n"+pri);
   
          Multipart multipart = new MimeMultipart();
            
            Transport.send(message);
    
           System.out.println("Email sent successfully");
 
           
            
            
            
           
        } catch(Exception ex)
        {
            ex.printStackTrace();
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
