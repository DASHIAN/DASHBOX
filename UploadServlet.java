package com.lec.file;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class UploadServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = res.getWriter();
		String contentType = req.getContentType();
		
		out.println("<html><body>");
		
		if(contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(req, out);
		} else {
			out.println("Content Type이 multipart타입이 아닙니다!!");
		}

		out.println("</body></html>");		
	}

	private void printPartInfo(HttpServletRequest req, PrintWriter out) 
			throws IOException, ServletException {

		String fileName = "dummy";
		int lastIndex = 0;
		
		Collection<Part> parts = req.getParts();
		
		for(Part part:parts) {
			out.println("<br> name = " + part.getName());
			String contentType = part.getContentType();
			out.println("<br> contentType = " + contentType);
		
			if(part.getHeader("Content-Disposition").contains("filename=")) {
				out.println("<br> size = " + part.getSize());
				fileName = getFileName(part);
				lastIndex = fileName.lastIndexOf("\\");
				fileName = fileName.substring(lastIndex+1);
				out.println("<br> fileName = " + fileName);
				
				if(part.getSize() > 0) {
					part.write(fileName);
					part.delete();
				}
			} else {
				String value = req.getParameter(part.getName());
				out.println("<br> value = " + value);
			}
			out.println("<hr>");
		}
	}

	private String getFileName(Part part) {
		for(String cd:part.getHeader("Content-Disposition").split(";")) {
			if(cd.trim().startsWith("filename=")) {
				return cd.substring(cd.indexOf('=')+1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
