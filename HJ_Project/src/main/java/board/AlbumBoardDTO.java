package board;

import java.sql.Timestamp;

/*
CREATE TABLE album_board (
	num INT PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	pass VARCHAR(16) NOT NULL,
	subject VARCHAR(50) NOT NULL,
	content VARCHAR(2000) NOT NULL,
	original_imgfile VARCHAR(200) NOT NULL,
	real_imgfile VARCHAR(200) NOT NULL,
	readcount INT NOT NULL,
	date DATETIME NOT NULL
);
 */

// funweb.file_board 테이블 1개 레코드 정보를 관리하는 FileBoardDTO 클래스 정의
public class AlbumBoardDTO {
	private int num;
	private String name;
	private String pass;
	private String subject;
	private String content;
	private String original_imgfile;
	private String real_imgfile;
	private int readcount;
	private Timestamp date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOriginal_imgfile() {
		return original_imgfile;
	}
	public void setOriginal_imgfile(String original_imgfile) {
		this.original_imgfile = original_imgfile;
	}
	public String getReal_imgfile() {
		return real_imgfile;
	}
	public void setReal_imgfile(String real_imgfile) {
		this.real_imgfile = real_imgfile;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
}
