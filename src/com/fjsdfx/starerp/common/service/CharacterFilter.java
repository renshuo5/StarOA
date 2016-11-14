package com.fjsdfx.starerp.common.service;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


public class CharacterFilter implements Filter{
	public CharacterFilter(){
		filterMaps.put("'", "?");
	}
	private Map<String, String> filterMaps = new HashMap<String, String>();
	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;  
		HashMap m=new HashMap(req.getParameterMap());
		for(Object o:m.keySet())
		{
			String key = (String)o;
			Object value= m.get(key);
			if(value instanceof String)
			{
				String stringValue = (String)value;
				for(String s:filterMaps.keySet())
				{
					stringValue.replaceAll(s, filterMaps.get(s));
				}
				m.put(key, stringValue);
			}else if(value instanceof String[])
			{
				String[] strings = (String[]) value;
				for(int i=0;i<strings.length;i++){
					for(String s:filterMaps.keySet())
					{
						strings[i] = strings[i].replace(s, filterMaps.get(s));
					}
				}
				m.put(key, strings);
			}else
			{
				m.put(key, null);
			}
		}
	    ParameterRequestWrapper wrapRequest=new ParameterRequestWrapper(req,m);         
	    chain.doFilter(wrapRequest, response); 
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	
	class ParameterRequestWrapper extends HttpServletRequestWrapper
	{
		private Map params;  
		public ParameterRequestWrapper(HttpServletRequest request,Map newParams) {  
		  super(request);  
		  this.params=newParams;  
		}  
		public Map getParameterMap() {  
		  return params;  
		}  
		public Enumeration getParameterNames() {  
		  Vector l=new Vector(params.keySet());  
		  return l.elements();  
		}  
		public String[] getParameterValues(String name) {  
		  Object v = params.get(name);  
		  if(v==null){  
		    return null;  
		  }else if(v instanceof String[]){  
		    return (String[]) v;  
		  }else if(v instanceof String){  
		    return new String[]{(String) v};  
		  }else{  
		    return new String[]{v.toString()};  
		  }  
		}  
		public String getParameter(String name) {  
		  Object v = params.get(name);  
		  if(v==null){  
		    return null;  
		  }else if(v instanceof String[]){            
		    String []strArr=(String[]) v;  
		    if(strArr.length>0){  
		      return strArr[0];  
		    }else{  
		      return null;  
		    }  
		  }else if(v instanceof String){  
		    return (String) v;  
		  }else{  
		    return v.toString();  
		  }  
		} 
	}
}
