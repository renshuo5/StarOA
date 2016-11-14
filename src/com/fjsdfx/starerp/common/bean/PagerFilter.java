package com.fjsdfx.starerp.common.bean;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class PagerFilter implements Filter {
	public static final String PAGE_SIZE_NAME = "pagesize";
	public static final int PAGE_SIZE = 10;

	public void destroy() {
	}

	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		// request.setAttribute("pageUrl",
		// request.getAttribute("javax.servlet.forward.servlet_path"));
		PagerInfo.setPagesize(getPagesize(httpServletRequest));
		PagerInfo.setOffset(getOffset(httpServletRequest));
		chain.doFilter(request, response);
		PagerInfo.removeOffset();
		PagerInfo.removePageSize();
	}


	public void init(FilterConfig arg0) throws ServletException {
	}

	protected int pagesizeIsChange(HttpServletRequest request) {
		String pagesizesString = request.getParameter(PAGE_SIZE_NAME);
		// 在request中是否有pager.pagesize参数 有：说明用户要改�?（将值放入session中）没有：使用默认�?
		if (pagesizesString != null && pagesizesString.trim() != "") {
			int ps = 0;
			try {
				ps = Integer.parseInt(pagesizesString);
			} catch (Exception e) {
			}// 以上代码可以防止非法参数传入
			if (ps != 0)// 得到合法参数
				return ps;
		}
		return 0;
	}
	protected Integer getOffset(HttpServletRequest request) {
		Integer offset = 0;
		if (pagesizeIsChange(request)!=0) {//当用户改变pagesize时为了分页不出错，从第一页开始显�?
			return 0;
		}
		String offsetString = request.getParameter("pager.offset");
		if (offsetString != null) {
			try {
				offset = Integer.parseInt(offsetString);
			} catch (NumberFormatException e) {
			}
		}
		return offset;
	}

	

	protected Integer getPagesize(HttpServletRequest request) {
		Integer pagesize = PAGE_SIZE;
		int psnew = pagesizeIsChange(request);
		if (psnew != 0) {
			pagesize = psnew;
			request.getSession().setAttribute(PAGE_SIZE_NAME, psnew);
		} else {
			pagesize = (Integer) request.getSession().getAttribute(
					PAGE_SIZE_NAME);
			if (pagesize == null) {//session中无�?则把pagesize放在request中传回给页面
				pagesize = PAGE_SIZE;
				request.setAttribute(PAGE_SIZE_NAME, PAGE_SIZE);
			}

			else {//获得用户前一次定义的pagesize�?
				pagesize = (Integer) request.getSession().getAttribute(
						PAGE_SIZE_NAME);
			}
		}
		return pagesize;
	}

}
