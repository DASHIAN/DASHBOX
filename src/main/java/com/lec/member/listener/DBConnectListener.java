package com.lec.member.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DBConnectListener implements ServletContextListener{
	public DBConnectListener() {}
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// web.xml context parameter 가져오기
		ServletContext context = sce.getServletContext();
		String drv = context.getInitParameter("driver");
		try {
			Class.forName(drv);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		}
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ServletContextListener.super.contextDestroyed(sce);
	}
}
