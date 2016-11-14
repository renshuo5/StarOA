package com.fjsdfx.starerp.common.bean;

public class PagerInfo {
	private static ThreadLocal<Integer> offset= new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pagesize=new ThreadLocal<Integer>();;
	public static  int getOffset() {
		Integer os=offset.get();
		 return os==null?0:os;
	}
	public static void setOffset(Integer os) {
		offset.set(os);
	}
	public static void removeOffset(){
		offset.remove();
	}
	public static int getPagesize() {
		Integer ps=pagesize.get();
		return ps==null?Integer.MAX_VALUE:ps;
	}
	public static void setPagesize(Integer ps) {
		pagesize.set(ps);
	}
	public static void removePageSize(){
		pagesize.remove();
	}
	
}
