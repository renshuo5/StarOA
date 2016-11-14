/**
 * 
 */
package com.fjsdfx.starerp.security.support;

import org.springframework.security.context.SecurityContextHolder;

import com.fjsdfx.starerp.security.model.User;


/**
 * @author Downpour
 * 
 */
public class SecurityUserHolder {

	/**
	 * Returns the current user
	 * 
	 * @return
	 */
	public static User getCurrentUser() {
		return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

}
