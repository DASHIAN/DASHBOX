package com.lec.member.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.member.dto.Member;
import com.lec.member.jdbc.JDBCUtil;

@WebServlet("/detail")
public class MemberDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		process(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		process(req, res);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
	
		String id = req.getParameter("id");
		String type= req.getParameter("type");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String res_url = "";
		
		ServletContext sct = getServletContext();
		String url = sct.getInitParameter("url");
		String usr = sct.getInitParameter("user");
		String pwd = sct.getInitParameter("pass");
		
		try {
			conn = DriverManager.getConnection(url, usr, pwd);
			sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				req.setAttribute("member",
								new Member(id, 
										rs.getString("password"),
										rs.getString("name"),
										rs.getString("regnumber"),
										rs.getString("gender"),
										rs.getInt("mileage")));
				
				if(type.equalsIgnoreCase("d")) {
					res_url = "member_detail.jsp";
				}else {
					res_url = "modify_form.jsp";
				}
			}else {
				req.setAttribute("error_message", id + "를(을) 찾지 못했습니다");
				res_url = "/login_form.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error_message", e.getMessage());
			res.sendRedirect("/resources/error.jsp");
		}finally {
			JDBCUtil.close(conn,pstmt,rs);
		}
		
		
	//	String res_url = "/member_detail.jsp";
		
		if(res_url != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(res_url);
			dispatcher.forward(req, res);
		}
	}
}
