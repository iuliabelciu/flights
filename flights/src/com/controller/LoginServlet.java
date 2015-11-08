package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.User;
import com.service.LoginService;


public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

	 String username = request.getParameter("username");	
	 String password = request.getParameter("password");
	 LoginService loginService = new LoginService();
	 boolean result = loginService.authenticateUser(username, password);
	 User user = loginService.getUserByUsername(username);
	 if(result == true){
		 request.getSession().setAttribute("user", user);	
		 if(user.getType().equals("admin"))
			 response.sendRedirect("admin.jsp");
		 else
			 response.sendRedirect("user.jsp");
	 }
	 else{
		 response.sendRedirect("error.jsp");
	 }
}

}