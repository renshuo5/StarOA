/**
 * 
 */
package com.fjsdfx.starerp.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.support.SecurityUserHolder;

/**
 * @author Downpour
 */
public class Index extends HttpServlet {

    private static final long serialVersionUID = -2695430823076562265L;

    /* (non-Javadoc)
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        User user = SecurityUserHolder.getCurrentUser();
        request.setAttribute("currentUser", user);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");  
        dispatcher.forward(request, response);
    }
    
    /* (non-Javadoc)
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
