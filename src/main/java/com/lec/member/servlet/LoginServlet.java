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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

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
		String pw = req.getParameter("pw");
		
		
		
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id, password, name, regnumber, gender, mileage from member where id = ?";
		
		ServletContext sct = getServletContext();
		String url = sct.getInitParameter("url");
		String usr = sct.getInitParameter("user");
		String pwd = sct.getInitParameter("pass");
		String res_url = "";
		
		try {
			conn = DriverManager.getConnection(url, usr, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pw.equals(rs.getString(2))) { // id가 있는 경우 pass를 비교
					HttpSession sess = req.getSession();
					Member member = new Member(id, pw, rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
					sess.setAttribute("login_info", member);
					// res.sendRedirect("/jsp08_member/resources/login_success.jsp");
					res_url = "/resources/login_success.jsp";
				} else { 
					req.setAttribute("error_message", "비밀번호가 틀립니다!! 다시 입력하세요!!");
					// res.sendRedirect("/jsp08_member/resources/error.jsp");
					res_url = "/resources/error.jsp";
				}
			}  else { // 아이디가 없는 경우
				req.setAttribute("error_message", id + "는(은) 존재하지 않는 아이디 입니다!! 다시 입력하세요!!");
				// res.sendRedirect("/jsp08_member/resources/error.jsp");
				res_url = "/resources/error.jsp";
				// res_url = "/login_form.jsp";
			}
		} catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("error_message", e.getMessage());
			res.sendRedirect("/jsp08_member/resources/error.jsp");
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		if(res_url != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(res_url);
			dispatcher.forward(req, res);
		}
	}
}



