package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.model.Flight;
import com.model.User;
import com.service.LoginService;
import com.service.FlightService;


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
	     response.sendRedirect("home.jsp");
	 }
	 else{
		 request.getSession().setAttribute("message", "Login was unsuccessful!");
		 response.sendRedirect("login.jsp");
	 }
}

}