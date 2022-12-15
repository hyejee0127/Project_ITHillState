package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;

public class ReplyDAO {
	// 댓글 등록
	// => 파라미터 : ReplyDTO 객체(reply)   리턴타입 : int(insertCount)
	public int insertReply(ReplyDTO reply) {
		int insertCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			// 댓글 INSERT 작업
			// => 글번호(num)는 AUTO_INCREMENT 옵션이 설정되어 있으므로 null 값 전달 시 자동 증가
			String sql = "INSERT INTO reply VALUES(null,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reply.getBoardType());
			pstmt.setInt(2, reply.getRefNum());
			pstmt.setString(3, reply.getName());
			pstmt.setString(4, reply.getContent());
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	// 댓글 목록 가져오기
	// => 파라미터 : 글번호(num)   리턴타입 : List<ReplyDTO>(replyList)
	public List<ReplyDTO> selectReplyList(int num, String boardType) {
		List<ReplyDTO> replyList = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			// reply 테이블의 원본 글번호(refNum)가 일치하는 레코드 조회 => 댓글번호 역순으로 정렬
			String sql = "SELECT * FROM reply WHERE refNum=? AND boardType=? ORDER BY num DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardType);
			
			rs = pstmt.executeQuery();
			
			// 전체 댓글 목록을 저장할 ArrayList 객체(replyList) 생성
			// => 제네릭타입 ReplyDTO 타입으로 지정
			replyList = new ArrayList<ReplyDTO>(); // ArrayList -> List(업캐스팅)
			
			while(rs.next()) {
				// 1개 댓글 정보를 저장할 ReplyDTO 객체 생성
				ReplyDTO reply = new ReplyDTO();
				reply.setNum(rs.getInt("num"));
				reply.setBoardType(rs.getString("boardType"));
				reply.setRefNum(rs.getInt("refNum"));
				reply.setName(rs.getString("name"));
				reply.setContent(rs.getString("content"));
				reply.setDate(rs.getTimestamp("date"));
				
				// ArrayList 객체에 ReplyDTO 객체 추가
				replyList.add(reply);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return replyList;
	}
	
	// 댓글 삭제
	// => 파라미터 : 글번호(num), 세션아이디(sId)  리턴타입 : int(deleteCount)
	public int deleteReply(int num, String sId) {
		int deleteCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			// 댓글 DELETE 작업
			// => 글번호와 아이디가 일치하는 레코드 삭제
			String sql = "DELETE FROM reply WHERE num=? AND name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, sId);
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return deleteCount;
	}
	
	// 전체 댓글 수 조회하는 selectReplyListCount() 메서드 정의
	// => 파라미터 : 없음    리턴타입 : int(replyListCount)
	public int replyCount(int refNum, String boardType) {
		int count = 0;
		
		// DB 작업에 사용할 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 1단계&2단계 작업을 수행하기 위해 JdbcUtil 클래스의 getConnection() 메서드 호출
		// => static 메서드이므로 클래스명만으로 접근 가능함
		con = JdbcUtil.getConnection();
		
		try {
			// 게시물 목록 갯수 조회 => COUNT(*) 함수 활용
			String sql = "SELECT COUNT(*) FROM reply WHERE refNum=? AND boardType=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, refNum);
			pstmt.setString(2, boardType);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
				System.out.println("댓글 갯수 확인 :"+ count);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - selectReplyListCount()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return count;
	}

	
}














