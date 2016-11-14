/**
 * 
 */
package com.fjsdfx.starerp.security.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Proxy;
import org.springframework.security.GrantedAuthority;
import org.springframework.security.GrantedAuthorityImpl;
import org.springframework.security.userdetails.UserDetails;

import com.fjsdfx.starerp.persons.model.Employee;
import com.fjsdfx.starerp.persons.model.Rasmessage;


/**
 * @author Chen_Luqiang
 *
 */
@Entity
@Proxy(lazy = false)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User  implements UserDetails,Serializable {
	private HashSet<Rasmessage> rasmessages2 = new HashSet<Rasmessage>();
	
	private HashSet<Rasmessage> rasmessages = new HashSet<Rasmessage>();
	@OneToMany(mappedBy="rper",cascade={CascadeType.ALL})
	public HashSet<Rasmessage> getRasmessages2() {
		return rasmessages2;
	}


	public void setRasmessages2(HashSet<Rasmessage> rasmessages2) {
		this.rasmessages2 = rasmessages2;
	}


	@OneToMany(mappedBy="sper",cascade={CascadeType.ALL})
	public HashSet<Rasmessage> getRasmessages() {
		return rasmessages;
	}


	public void setRasmessages(HashSet<Rasmessage> rasmessages) {
		this.rasmessages = rasmessages;
	}

	private static final long serialVersionUID = 8026813053768023527L;

    @Id
	@GeneratedValue
	private Integer id;
	
	private String name;
	

	@OneToOne
	@JoinColumn(name="EmployeeId")
	private Employee employee;
	



	public Employee getEmployee() {
		return employee;
	}
	
	
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	private String password;
	
	private boolean disabled;
	
	@ManyToMany(targetEntity = Role.class, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<Role> roles;
	
	@Transient
	private Map<String, List<Resource>> roleResources;
	
	/**
	 * The default constructor
	 */
	public User() {
		
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#getAuthorities()
	 */
	public GrantedAuthority[] getAuthorities() {
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>(roles.size());
    	for(Role role : roles) {
    		grantedAuthorities.add(new GrantedAuthorityImpl(role.getName()));
    	}
        return grantedAuthorities.toArray(new GrantedAuthority[roles.size()]);
	}
	
	/**
	 * Returns the authorites string
	 * 
	 * 
	 * @return
	 */
	public String getAuthoritiesString() {
	    List<String> authorities = new ArrayList<String>();
	    for(GrantedAuthority authority : this.getAuthorities()) {
	        authorities.add(authority.getAuthority());
	    }
	    return StringUtils.join(authorities, ",");
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#getPassword()
	 */
	public String getPassword() {
		return password;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#getUsername()
	 */
	public String getUsername() {
		return name;
	}

	
	
	

	
	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#isAccountNonExpired()
	 */
	public boolean isAccountNonExpired() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#isAccountNonLocked()
	 */
	public boolean isAccountNonLocked() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#isCredentialsNonExpired()
	 */
	public boolean isCredentialsNonExpired() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#isEnabled()
	 */
	public boolean isEnabled() {
		return !disabled;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return the disabled
	 */
	public boolean isDisabled() {
		return disabled;
	}

	/**
	 * @return the roles
	 */
	public Set<Role> getRoles() {
		return roles;
	}

	/**
	 * @return the roleResources
	 */
	public Map<String, List<Resource>> getRoleResources() {
		// init roleResources for the first time
		if(this.roleResources == null) {
			
			this.roleResources = new HashMap<String, List<Resource>>();
			
			for(Role role : this.roles) {
				String roleName = role.getName();
				Set<Resource> resources = role.getResources();
				for(Resource resource : resources) {
					String key = roleName + "_" + resource.getType();
					if(!this.roleResources.containsKey(key)) {
						this.roleResources.put(key, new ArrayList<Resource>());
					}
					this.roleResources.get(key).add(resource);					
				}
			}
			
		}
		return this.roleResources;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @param disabled the disabled to set
	 */
	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	/**
	 * @param roles the roles to set
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
}
