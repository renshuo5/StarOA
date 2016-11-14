/**
 * 
 */
package com.fjsdfx.starerp.security.support;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.security.userdetails.UserDetails;
import org.springframework.security.userdetails.UserDetailsService;
import org.springframework.security.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.fjsdfx.starerp.security.model.Resource;
import com.fjsdfx.starerp.security.model.User;




/**
 * @author Downpour
 */
@Service("securityManager")
public class SecurityManagerSupport extends HibernateDaoSupport implements UserDetailsService, SecurityManager {
    
    /**
     * Init sessionFactory here because the annotation of Spring 2.5 can not support override inject
     *  
     * @param sessionFactory
     */
    @Autowired
    public void init(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }
    
    /* (non-Javadoc)
     * @see org.springframework.security.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
     */
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException, DataAccessException {
        List<User> users = getHibernateTemplate().find("FROM User user WHERE user.name = ? AND user.disabled = false", userName);
        if(users.isEmpty()) {
            throw new UsernameNotFoundException("User " + userName + " has no GrantedAuthority");
        }
        return users.get(0);
    }
    
    /* (non-Javadoc)
     * @see com.javaeye.sample.security.SecurityManager#loadUrlAuthorities()
     */
    public Map<String, String> loadUrlAuthorities() {
        Map<String, String> urlAuthorities = new HashMap<String, String>();
        List<Resource> urlResources = getHibernateTemplate().find("FROM Resource resource WHERE resource.type = ?", "URL");
        for(Resource resource : urlResources) {
            urlAuthorities.put(resource.getValue(), resource.getRoleAuthorities());
        }
        return urlAuthorities;
    }

    
}
