/**
 * 
 */
package com.fjsdfx.starerp.web.loader;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fjsdfx.starerp.security.support.SecurityManager;

/**
 * @author Downpour
 */
public class ServletContextLoaderListener implements ServletContextListener {

    /* (non-Javadoc)
     * @see javax.servlet.ServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        SecurityManager securityManager = this.getSecurityManager(servletContext);
        
        Map<String, String> urlAuthorities = securityManager.loadUrlAuthorities();
        servletContext.setAttribute("urlAuthorities", urlAuthorities);
    }

    
    /* (non-Javadoc)
     * @see javax.servlet.ServletContextListener#contextDestroyed(javax.servlet.ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        servletContextEvent.getServletContext().removeAttribute("urlAuthorities");
    }

    /**
     * Get SecurityManager from ApplicationContext
     * 
     * @param servletContext
     * @return
     */
    protected SecurityManager getSecurityManager(ServletContext servletContext) {
       return (SecurityManager) WebApplicationContextUtils.getWebApplicationContext(servletContext).getBean("securityManager"); 
    }

}
