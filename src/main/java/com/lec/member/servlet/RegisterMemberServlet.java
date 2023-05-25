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

@WebServlet("/register")
public class RegisterMemberServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}
	private void process(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id =req.getParameter("id");
		String name =req.getParameter("name");
		String pw =req.getParameter("pw");
		String ssn =req.getParameter("ssn");
		String gender =req.getParameter("gender");
		int mileage = 1000;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String res_url = "";
		int cnt = 0;
		
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
				req.setAttribute("error_message", id + "는(은) 중복된 아이디 입니다. 다시 입력하세요");
				res_url = "/resources/error.jsp";
			}else {
				sql = "insert into member(id, name, password, regnumber, gender, mileage) values(?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, pw);
				pstmt.setString(4, ssn);
				pstmt.setString(5, gender);
				pstmt.setInt(6, mileage);
				cnt = pstmt.executeUpdate();
				//System.out.println("회원등록성공");
				req.setAttribute("member", new Member(id, pw, name, ssn, gender, mileage));
				res_url = "/resources/register_success.jsp";
			}
		} catch (Exception e) {
			req.setAttribute("error_message", "DB접속실패 or 회원등록 실패");
			res_url = "/resources/error.jsp";
		}finally {
			JDBCUtil.close(conn,pstmt,rs);
		}
		if(res_url != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(res_url);
			dispatcher.forward(req, res);
	}
	
	}
	
}














