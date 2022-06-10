package edu.kh.hotellala.member.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.hotellala.member.model.vo.Member;

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/signUp.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberEmail = req.getParameter("memberEmail");
		String memberPw = req.getParameter("memberPw");
		String memberName = req.getParameter("memberName");
		String memberTel = req.getParameter("memberTel");
		String memberYear = req.getParameter("memberYear");
		String memberMonth = req.getParameter("memberMonth");
		String memberDay = req.getParameter("memberDay");
		
		Member mem = new Member();
		
		mem.setMemberEmail(memberEmail);
		mem.setMemberPw(memberPw);
		mem.setMemberName(memberName);
		mem.setMemberTel(memberTel);
		mem.setMemberYear(memberYear);
		mem.setMemberMonth(memberMonth);
		mem.setMemberDay(memberDay);
	}
}