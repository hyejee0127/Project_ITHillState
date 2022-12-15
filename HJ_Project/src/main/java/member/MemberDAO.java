package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardDTO;
import board.FileBoardDTO;
import db.JdbcUtil;

public class MemberDAO {
	// 아이디 중복 확인 수행
	// => 파라미터 : 아이디(id)    리턴타입 : boolean(isDuplicate)
	public boolean checkId(String id) {
		boolean isDuplicate = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 1단계 & 2단계
		Connection con = JdbcUtil.getConnection();
		
		try {
			// SELECT 구문을 사용하여 아이디가 일치하는 레코드 검색
			// => 아이디가 일치하는 레코드가 있을 경우 isDuplicate 변수값을 true 로 변경
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isDuplicate = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return isDuplicate;
	}
	
	// 회원 가입 작업 - insertMember()
	// => 파라미터 : MemberDTO 객체(member)   리턴타입 : int(insertCount)
	public int insertMember(MemberDTO member) {
		int insertCount = 0;
		
		Connection con = JdbcUtil.getConnection();
		
		PreparedStatement pstmt = null;
		
		try {
			// 회원 가입(INSERT) 작업 수행
			String sql = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId()); // 아이디
			pstmt.setString(2, member.getPass()); // 패스워드
			pstmt.setString(3, member.getName()); // 이름
			pstmt.setString(4, member.getEmail()); // 이메일
			pstmt.setString(5, member.getPost_code()); // 우편번호
			pstmt.setString(6, member.getAddress1()); // 기본주소
			pstmt.setString(7, member.getAddress2()); // 상세주소
			pstmt.setString(8, member.getPhone()); // 전화번호
			pstmt.setString(9, member.getMobile()); // 폰번호

			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	// 로그인
	public boolean loginMember(MemberDTO member) {
		boolean isLoginSuccess = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 1단계 & 2단계
		Connection con = JdbcUtil.getConnection();
		
		try {
			// SELECT 구문을 사용하여 아이디가 일치하는 레코드 검색
			// => 아이디, 패스워드 일치하는 레코드 검색
			String sql = "SELECT * FROM member WHERE id=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isLoginSuccess = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return isLoginSuccess;
	}
	
	// 회원 목록 조회
	public ArrayList select() {
		// 글목록 조회 결과를 리턴할 ArrayList 타입 변수 선언
		// 1개 레코드가 저장된 MemberDTO 객체 복수개를 하나의 묶음으로 관리할 ArrayList 타입
		ArrayList memberList = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 0 ~ 2단계 - 공통작업
			con = JdbcUtil.getConnection();
			// 3단계. SQL 구문 작성 및 전달
			// => member 테이블의 모든 레코드 조회(id 컬럼 기준 오름차순 정렬)
			String sql = "SELECT * FROM member ORDER BY id ASC";
			pstmt = con.prepareStatement(sql);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			// 복수개의 레코드(복수개의 MemberDTO 객체)를 저장하는 ArrayList 객체 생성
			// => 반복문 실행 전 먼저 객체 생성한 후 반복문 내에서 MemberDTO 객체 저장 필수!
			memberList = new ArrayList();
			
			// 조회 결과 테이블을 반복문을 통해 레코드 반복 접근
			while(rs.next()) {
				// 1개 게시물 정보를 저장하는 MemberDTO 객체(member) 생성
				MemberDTO member = new MemberDTO();
				// ResultSet 객체의 1개 레코드 각 컬럼 데이터를 MemberDTO 객체에 저장
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPost_code(rs.getString("post_code"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setPhone(rs.getString("phone"));
				member.setMobile(rs.getString("mobile"));
				member.setDate(rs.getDate("date"));
				// while 문을 통해 레코드를 반복하게 되면 최종적으로 MemberDTO 객체에는
				// 마지막 레코드 정보만 저장되어 있게 된다!
				
				// 1개 레코드 정보가 저장된 MemberDTO 객체를 ArrayList 객체에 추가(add())
				// => 주의! add() 메서드 파라미터 타입은 Object 타입이므로
				//    MemberDTO 객체가 저장되는 시점에 Object 타입으로 업캐스팅이 일어남
				memberList.add(member);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return memberList;
	}
	
	// 게시물 목록 조회를 수행하는 selectBoardList() 메서드 정의(검색 기능 추가)
	// => 파라미터 : 시작 행번호, 페이지 당 게시물 목록 수, 검색어
	public ArrayList<MemberDTO> selectMemberList(String searchSelect, String keyword) {
		ArrayList<MemberDTO> memberList = null;
		
		// DB 작업에 사용할 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 1단계&2단계 작업을 수행하기 위해 JdbcUtil 클래스의 getConnection() 메서드 호출
		con = JdbcUtil.getConnection();
		
		try {
			// 3단계. SQL 구문 작성 및 전달
			// 검색 기능이 추가됐으므로 WHERE 절에 검색어 추가(제목 검색)
			// => WHERE 절에 LIKE 결합(ORDER BY 절보다 앞쪽에 위치)
			String sql = "SELECT * FROM member WHERE " + searchSelect + " LIKE ? ORDER BY id ASC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%"); // 검색어를 포함하기 위해 % 결합
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			// 전체 게시물 목록을 저장할 ArrayList 객체 생성
			memberList = new ArrayList<MemberDTO>();
			
			// 조회 결과가 있을 경우 레코드 접근 반복
			while(rs.next()) {
				// 1개 레코드를 저장할 FileBoardDTO 객체 생성 후 데이터 저장
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPost_code(rs.getString("post_code"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setPhone(rs.getString("phone"));
				member.setMobile(rs.getString("mobile"));
				member.setDate(rs.getDate("date"));
				
				memberList.add(member);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - selectMemberList()");
			e.printStackTrace();
		} finally {
			// DB 자원 반환 - JdbcUtil 클래스의 static 메서드 close() 호출
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return memberList;
	}
	
	//탈퇴하기
	public int deleteMember(String id) {
		int deleteCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1단계 & 2단계
			con = JdbcUtil.getConnection();
			
			// 글번호와 패스워드가 일치하는 레코드 삭제
			String sql = "DELETE FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - deleteMember()");
			e.printStackTrace();
		} finally {
			// DB 자원 반환
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return deleteCount;
	}	
	
	//회원 정보 보기
//	public MemberDTO selectMember(String id) {
//		MemberDTO member = null;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		// 1단계 & 2단계
//		con = JdbcUtil.getConnection();
//		
//		try {
//			String sql = "SELECT * FROM member WHERE id=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				// 조회 결과가 있을 경우 BoardDTO 객체 생성 및 데이터 저장
//				member = new MemberDTO();
//				member.setId(id); // 아이디
//				member.setPass(rs.getString("pass")); // 패스워드
//				member.setName(rs.getString("name")); // 이름
//				member.setEmail(rs.getString("email")); // 이메일
//				member.setPost_code(rs.getString("post_code")); // 우편번호
//				member.setAddress1(rs.getString("address1")); // 기본주소
//				member.setAddress2(rs.getString("address2")); // 상세주소
//				member.setPhone(rs.getString("phone")); // 전화번호
//				member.setMobile(rs.getString("mobile")); // 폰번호
//			}
//		}  catch (SQLException e) {
//			System.out.println("SQL 구문 오류 발생! - selectMember()");
//			e.printStackTrace();
//		} finally {
//			// DB 자원 반환
//			JdbcUtil.close(rs);
//			JdbcUtil.close(pstmt);
//			JdbcUtil.close(con);
//		}
//		return member;
//	}
	
	//회원 정보 수정
//	public int updateMember(MemberDTO member) {
//		int updateCount = 0;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		try {
//			// 1단계 & 2단계
//			con = JdbcUtil.getConnection();
//			
//			// 글번호와 패스워드가 일치하는 게시물의 작성자, 제목, 내용 수정(UPDATE)
//			String sql = "UPDATE member SET name=?,email=?,post_code=?,address1=?,address2=?,phone=?,mobile=? WHERE id=? AND pass=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, member.getName());
//			pstmt.setString(2, member.getEmail());
//			pstmt.setString(3, member.getPost_code());
//			pstmt.setString(4, member.getAddress1());
//			pstmt.setString(5, member.getAddress2());
//			pstmt.setString(6, member.getPhone());
//			pstmt.setString(7, member.getMobile());
//			pstmt.setString(8, member.getId());
//			pstmt.setString(9, member.getPass());
//			
//
//			pstmt.executeUpdate();
//			
//			updateCount = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL 구문 오류 발생! - updateMember()");
//			e.printStackTrace();
//		} finally {
//			// DB 자원 반환
//			JdbcUtil.close(pstmt);
//			JdbcUtil.close(con);
//		}
//		
//		return updateCount;
//	}	
	
}















