package edu.kh.hotellala.member.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.member.model.service.MemberService;
import edu.kh.hotellala.member.model.vo.Member;

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {

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
		String[] address = req.getParameterValues("memberAddress");
		String[] br = req.getParameterValues("memberBR");
//      String bt ="";

//      String memberYear = req.getParameter("memberYear");
//      String memberMonth = req.getParameter("memberMonth");
//      String memberDay = req.getParameter("memberDay");

//      bt += memberYear+"년"+memberMonth+"월"+memberDay+"일";

		String memberAddress = null;
		String memberBR = null;
		if (!address[0].equals("")) {
			memberAddress = String.join(",,", address);

		}
		if (!br[0].equals("")) {
			memberBR = String.join("/", br);
		}
		System.out.println(memberAddress);
		Member mem = new Member();

		mem.setMemberEmail(memberEmail);
		mem.setMemberPw(memberPw);
		mem.setMemberName(memberName);
		mem.setMemberTel(memberTel);
		mem.setMemberAddress(memberAddress);
		mem.setMemberBR(memberBR);
		try {
			MemberService service = new MemberService();

			int result = service.signUp(mem);

			HttpSession session = req.getSession();

			if (result > 0) {
				session.setAttribute("message", "회원 가입 성공");
			} else {
				session.setAttribute("message", "회원 가입 실패");
			}

			resp.sendRedirect(req.getContextPath());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
