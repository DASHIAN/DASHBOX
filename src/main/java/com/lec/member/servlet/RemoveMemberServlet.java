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
import javax.servlet.http.HttpSession;

import com.lec.member.dto.Member;
import com.lec.member.jdbc.JDBCUtil;

@WebServlet("/remove")
public class RemoveMemberServlet extends HttpServlet {

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
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from member where id = ?";
		String res_url = "";
		int cnt = 0;	

		ServletContext sct = getServletContext();
		String url = sct.getInitParameter("url");
		String usr = sct.getInitParameter("user");
		String pwd = sct.getInitParameter("pass");

		HttpSession sess = req.getSession();
		Member member = (Member) sess.getAttribute("login_info");

		if(member != null) {
			try {
				conn = DriverManager.getConnection(url, usr, pwd);	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getId());			
				cnt = pstmt.executeUpdate();
				res_url = "/";				
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error_message", e.getMessage());
				res_url = "/resources/error.jsp";
			} finally {
				JDBCUtil.close(conn, pstmt, rs);
			}
		} else {
			req.setAttribute("error_message", "로그인이 되지 않았습니다! " 
					+ "로그인후에 회원정보를 수정할 수 있습니다!");
			res_url = "/login_form.jsp";
		}
	
		if(res_url != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(res_url);
			dispatcher.forward(req, res);
		}	
	}
}









