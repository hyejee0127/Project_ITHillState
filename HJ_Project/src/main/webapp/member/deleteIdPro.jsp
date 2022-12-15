<%@page import="member.MemberDAO"%>
<%@page import="board.ProposalBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 글번호(num), 패스워드(pass) 파라미터 가져오기
String id = (String)session.getAttribute("sId");

// BoardDAO 객체 생성 후 deleteBoard() 메서드를 호출하여 글 삭제 작업 수행
// => 파라미터 : 글번호, 패스워드    리턴타입 : int(deleteCount)
MemberDAO dao = new MemberDAO();
int deleteCount = dao.deleteMember(id);

// 작업 결과 판별 
// => 성공 시 글목록(notice.jsp) 으로 이동하고, 
//    실패 시 자바스크립트로 "글 삭제 실패" 출력하고 이전 페이지로 돌아가기
if(deleteCount > 0) {%>
	<script type="text/javascript">
	alert("탈퇴가 완료 되었습니다.");
	</script>
	<%
	session.invalidate();
	response.sendRedirect("../main/main.jsp");
}
%>