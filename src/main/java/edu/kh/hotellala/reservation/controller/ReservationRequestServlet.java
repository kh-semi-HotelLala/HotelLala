package edu.kh.hotellala.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import edu.kh.hotellala.member.model.vo.Member;
import edu.kh.hotellala.reservation.model.service.ReservationRequestService;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;
import edu.kh.hotellala.reservation.model.vo.RoomType;

@WebServlet("/reservation/date")
public class ReservationRequestServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//화면 불러오기
		String path = "/WEB-INF/views/reservation/reservationDate.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//이용가능한 객실 조회
		
		//객실 + 날짜 값 입력받아오기
		//ajax의 data로 파라미터 값을 얻어오고
		//얻어온 파라미터 값을 세션에 저장!!
		
		try{
			//Session 객체 얻어오기
			HttpSession session = req.getSession();
			
			//memberNo 얻어오기
			int memberNo = 0;
			
			if(session.getAttribute("loginMember") != null) {
				
				Member member = (Member)(session.getAttribute("loginMember"));
				memberNo = member.getMemberNo();
				
			} else {
				session.setAttribute("message", "로그인 후 이용해주세요.");
				return;
			}
			
			//전달된 파라미터 변수에 저장
			String reserveDate = req.getParameter("reserveDate");
			String dateRange = req.getParameter("dateRange"); //1박
			int adultCount = Integer.parseInt( req.getParameter("adultCount") );
			int childCount = Integer.parseInt( req.getParameter("childCount") );
			
			//reserveDate -> 체크인 날짜 - 체크아웃 날짜 자르기
			Date checkIn = Date.valueOf( reserveDate.substring(0, 10) );
			Date checkOut = Date.valueOf( reserveDate.substring(13, 23) );
			
			ReservationRequest reservation = new ReservationRequest();
			
			//주문번호 생성
			reservation.setRequestNo( makeRequestNo() );
			
			reservation.setMemberNo(memberNo);
			
			reservation.setCheckIn(checkIn);
			reservation.setCheckOut(checkOut);
			reservation.setDateRange(dateRange);
			reservation.setAdultCount(adultCount);
			reservation.setChildCount(childCount);
		
			if(reservation != null) {
				session.setAttribute("reservation", reservation);
			}
			
			//ReservationRequestService 불러오기
			ReservationRequestService service = new ReservationRequestService();
			
			//객실 조회하기
			List<RoomType> roomList = service.selectAvailableRoom(reservation);
			
			req.setAttribute("roomList", roomList);
			
			//JSON 변환 + 응답
			new Gson().toJson(roomList, resp.getWriter());
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private String makeRequestNo() {
		
		String requestNo = "";

		LocalDateTime time = LocalDateTime.now();
		String timeSet = time.format( DateTimeFormatter.ofPattern("yyyyMMddHHmmss") );
		
		//0~9 난수 생성
		int random = (int)(Math.random() * 10);
		
		requestNo = "OR" + timeSet + random;
		
		return requestNo;
	}
}
