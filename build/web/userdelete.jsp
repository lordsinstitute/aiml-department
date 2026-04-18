<%-- 
    Document   : userdelete
    Created on : Feb 23, 2014, 11:12:32 PM
    Author     : java
--%>
<%@page import="com.commondb.Common_DB"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="BacImages/images16.jpg">
        <center>
       <form name="form" method="post" action="Download">
           <br>
           </br>
           <table width="" border="0">
                <tr>
                    <td>
                        <div align="center">
                            <font size="10" face="Colonna MT">Group List</font></div>
                    </td>
                </tr>
            </table>
           <br>
           </br>
           <table width="250" border="0">
               <tr>
                   <td>                       
                           <div align="center"><font size="5" face="Comic Sans Ms">Members Name:</font></div>
                           <label for="groupname"></label>
                   </td>
                   <td>
               <select name="gname">
                   <%  
           ArrayList li=new ArrayList();
            ResultSet rr=Common_DB.ViewTable("erasurecode","registration");
          
         while(rr.next())            
         {
          String n=rr.getString(1);   
           
             li.add(n);             
         }
            if(!(li.isEmpty()))        
       for(int ij=0; ij<li.size(); ij++)                   
                     {
           %>
           <option value="<%=li.get(ij)%>"> <%=li.get(ij)%></option>
               <%
                     }
             
                     else {
               
                  
          %>
            <option value=""> </option>
          <%
         }
%>
               </select>
                   </td>
               </tr>
               <tr>
                   <td>
                       <div align="center"><font size="5" face="Comic Sans Ms">Group Key:</font></div>
                       <label for="groupkey"></label>                       
                   </td>
                   <td>
                       <input type="password" name="groupkey" id="groupkey">
                   </td>
               </tr>               
           </table>
           <table width="250" border="0">
               <tr>                   
                   <td>  
                       <div align="center">
                           <input type="submit" name="submit" id="submit" value="submit">    
                            </div>
                   </td>                   
               </tr>
           </table>
       </form>
        </center>
    </body>
</html>
