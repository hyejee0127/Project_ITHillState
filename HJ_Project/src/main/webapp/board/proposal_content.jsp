<%@page import="board.ProposalBoardDAO"%>
<%@page import="board.ProposalBoardDTO"%>
<%@page import="board.ReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.ReplyDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 글번호 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));

// 데이터베이스 작업을 위한 BoardDAO 객체 생성
ProposalBoardDAO dao = new ProposalBoardDAO();

// BoardDAO 객체의 updateReadcount() 메서드를 호출하여 게시물 조회수 증가 작업 수행
// => 파라미터 : 글번호(num)   리턴타입 : void
dao.updateReadcount(num);

// BoardDAO 객체의 selectBoard() 메서드를 호출하여 게시물 1개 조회 작업 수행
// => 파라미터 : 글번호(num)   리턴타입 : BoardDTO(board)
ProposalBoardDTO board = dao.selectProposalBoard(num);

// 날짜 표시 형식 변경을 위한 SimpleDateFormat 객체 생성
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // ex) 2022-08-19 17:35:05

//세션 아이디 가져오기
String sId = (String)session.getAttribute("sId");
// 세션에 저장된 아이디가 null 이거나 게시물의 아이디와 일치하지 않으면 
// 자바스크립트를 통해 "접근 권한이 없습니다!" 출력 후 돌아가기
// 단, 관리자 아이디("admin")는 접근 권한 허용

if(sId == null || !sId.equals("admin") && !sId.equals(board.getName())) {
	// 관리자 아이디가 아니고 세션 아이디가 일치하지 않으면 권한 없음
	// <-> 관리자 아이디이거나 세션 아이디가 일치하면 권한 있음
	%>
	<script>
		alert("글 작성자 및 관리자만 접근 가능합니다!");
		history.back();
	</script>
	<%
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Proposal Content</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	function forwardReply() {
		// 세션 아이디가 있을 경우에만 쓰기 동작 수행 => 세션 아이디 없으면 경고 출력 후 중단
		<%if(sId != null) {%>
			var content = document.getElementById("reply_content").value;
			
			// notice_content_reply_writePro.jsp 페이지로 포워딩
			// => 파라미터 : 글번호, 작성자(세션아이디), 댓글내용, 댓글게시판타입(notice)
			location.href = "proposal_content_reply_writePro.jsp?boardType=proposal&num=<%=board.getNum()%>&name=<%=sId%>&content=" + content;
		<%} else {%>
			alert("댓글은 로그인 후 사용 가능합니다!");
		<%}%>
	}
</script>	
</head>
<body class="d-flex flex-column min-vh-100">
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 내용 시작 -->
	<main class="container-sm">
		<article>
			<table class="table" style="margin-top: 50px;">
			<tr>
				<td>글번호</td>
				<td style="text-align: left;"><%=board.getNum() %></td>
				<td>글쓴이</td>
				<td style="text-align: left;"><%=board.getName() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td style="text-align: left;"><%=sdf.format(board.getDate()) %></td>
				<td>조회수</td>
				<td style="text-align: left;"><%=board.getReadcount() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3" style="text-align: left;"><%=board.getSubject() %></td>
			</tr>
			<tr>
				<td style="vertical-align: middle;">내용</td>
				<td colspan="3" style="height: 200px; text-align: left;"><%=board.getContent() %></td>
			</tr>
				<tr>
				<!-- 댓글 시작 -->
					<td style="vertical-align: middle;">댓글</td>
					<td colspan="2">
						<textarea rows="4" style="width: 1000px;" class="form-control" id="reply_content" placeholder="댓글을 입력해주세요"></textarea>
					</td>
					<td>
					<button class ="btn btn-outline-secondary btn-sm" style="cursor:pointer; margin-top: 40px; margin-right: 40px;" onclick="forwardReply()">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
							<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
						</svg> 등록
					</button>
					</td>
				</tr>			
				<!-- 댓글 목록 가져와서 출력하기 -->
				<%
				// ReplyDAO 객체 생성 후 selectReplyList() 메서드를 호출하여 댓글 목록 가져오기
				// => 파라미터 : 글번호(num)   리턴타입 : List<ReplyDTO>(replyList)
				ReplyDAO replyDAO = new ReplyDAO();
				String BoardType = "proposal";
				List<ReplyDTO> replyList = replyDAO.selectReplyList(num, BoardType);
				
				// 날짜 및 시각 형식을 "월월-일일 시시:분분" 형식으로 설정
				SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd HH:mm");
				
				// List 객체 크기만큼 반복하면서 ReplyDTO 객체(reply) 꺼내기 => 향상된 for문 사용
				for(ReplyDTO reply : replyList) {
					%>
					<tr>
						<td style="text-align: center;"><%=reply.getName() %></td>
						<td style="text-align: left; padding-left: 20px;"><%=reply.getContent() %></td>
						<td class="text-muted" style="text-align: right; font-size: small; "><%=sdf2.format(reply.getDate()) %></td>
						<td>
							<!-- 댓글 작성자와 세션 아이디가 같으면 삭제 버튼 표시 -->
							<%if(sId != null && sId.equals(reply.getName())){%>
							<button class ="btn btn-outline-secondary btn-sm" style="cursor:pointer; margin-right: 40px;" onclick="location.href='proposal_content_reply_deletePro.jsp?num=<%=reply.getNum()%>&refNum=<%=num%>'">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
									<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg> 삭제
							</button>
							<%} %>
						</td>
					</tr>
					<%
				}
				%>
				<!-- 댓글 끝 -->
		</table>
		<div id="table_search">
			<input type="button" value="수정" class="btn btn-secondary" onclick="location.href='proposal_update.jsp?num=<%=num%>'">
			<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='proposal_delete.jsp?num=<%=num%>'"> 
			<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='proposal.jsp'">
		</div>
		</article>
	</main>  
	<!-- 푸터 들어가는곳 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- 푸터 들어가는곳 -->
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>