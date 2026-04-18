<%-- 
    Document   : uploadshare
    Created on : Feb 28, 2017, 5:53:56 PM
    Author     : Pantech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main">
		<form action="loginsharefile" id="" name="" method="post">
    		<h1><span>USER</span> <lable> Login </lable> </h1>
  			<div class="inset">
	  			<p>
	    		 <label for="username">USERNAME</label>
   	 			<input type="text" name="username" placeholder="" required />
				</p>
  				<p>
				    <label for="password">PASSWORD</label>
				    <input type="password" name="password" placeholder="" required />
  				</p>
				
 			 </div>
 	 
			  <p class="p-container">
			
			    <input type="submit" value="Login">
			  </p>
		</form>
	</div>  
    </body>
</html>
