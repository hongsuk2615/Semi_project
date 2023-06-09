package com.khtime.board.model.service;
import static com.khtime.common.JDBCTemplate.close;
import static com.khtime.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.BoardDao;
import com.khtime.board.model.vo.Board;
import com.khtime.board.model.vo.BoardAttachment;
import com.khtime.board.model.vo.Category;
import com.khtime.common.JDBCTemplate;
import com.khtime.common.model.vo.PageInfo;
import com.khtime.member.model.vo.Member;



public class BoardService {
	
	public ArrayList<Board> selectBoard(int cNo, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Board> boardList = new BoardDao().selectBoard(conn, cNo, pi);

		close(conn);

		return boardList;
	}
	
	public ArrayList<BoardAttachment> selectAttachmentList(int bNo) {
		Connection conn = getConnection();

		ArrayList<BoardAttachment> attachmentList = new BoardDao().selectAttachmentList(conn, bNo);

		close(conn);

		return attachmentList;
	}
	
	public Board selectContent(int bNo) {
		Connection conn = getConnection();

		Board b = new BoardDao().selectContent(conn, bNo);

		close(conn);

		return b;
	}
	
	public int replyCount(int bNo) {
		Connection conn = getConnection();

		int result = new BoardDao().replyCount(conn, bNo);
		close(conn);

		return result;
	}
	
	public int recommendCount(int bNo) {
		Connection conn = getConnection();

		int result = new BoardDao().recommendCount(conn, bNo);
		close(conn);

		return result;
	}

	public int scrapCount(int bNo) {
		Connection conn = getConnection();

		int result = new BoardDao().scrapCount(conn, bNo);
		close(conn);

		return result;
	}

	
	public ArrayList<Board> bestList(int rcCount, PageInfo pi, String year) {
		Connection conn = getConnection();

		ArrayList<Board> bestList = new BoardDao().bestList(conn, rcCount, pi, year);

		close(conn);

		return bestList;
	}

	public int bestListCount(int rcCount) {
		Connection conn = getConnection();

		int result = new BoardDao().bestListCount(conn, rcCount);

		close(conn);

		return result;
	}
	public ArrayList<Board> getHotBestBoardlist(int recommendCount, String year) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().getHotBestBoardlist(conn, recommendCount, year);
		close(conn);
		return list;
	}
	
	public int insertBoard(Board b, int userNo, ArrayList<BoardAttachment> list) {
		Connection conn = JDBCTemplate.getConnection();

		int result1 = new BoardDao().insertBoard(conn, b, userNo);
		int result2 = 1;
		if (!list.isEmpty()) {
			result2 = new BoardDao().insertAttachment(conn, list);
		}
		if(result1 * result2 > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result1 * result2;
	}
	
	public int deleteContent(int bNo, int userNo,int authority, int aC, String isQuestion) {
		Connection conn = JDBCTemplate.getConnection();

		int result1 = new BoardDao().deleteContent(conn, bNo,authority, userNo, isQuestion);
		int result2 = 1;
		
		if(aC > 0) {
		result2 = new BoardDao().deleteAttachment(conn, bNo);
		}
		
		if(result1 * result2 > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result1 * result2;
	}
	

	public int updateContent(Board b, ArrayList<BoardAttachment> list, String deleteImg, Member loginUser) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result1 = new BoardDao().updateContent(conn, b, loginUser);
		int result2 = deleteImg.equals("") ? 1 : new BoardDao().updateAttachment(conn, deleteImg);
		int result3 = list.isEmpty() ? 1 : new BoardDao().insertAttachment(conn, list, b);
		System.out.println(result1+""+result2+""+result3);
		if(result1*result2*result3 > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result1*result2*result3;
	}
	public ArrayList<Category> categoryTitle( String searchTitle){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Category> cn = new  BoardDao().categoryTitle(conn , searchTitle);
	
		close(conn); 
		
		return cn;
	}
	
	public int boardRequest( String loginUserId,String boardTitle, String reason , int loginUserNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result2 = new BoardDao().boardCategoryreq(conn,boardTitle,loginUserNo);
		int result1 = new BoardDao().boardRequest(conn,loginUserId,boardTitle,reason);
		if(result1 > 0 && result2 > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		} JDBCTemplate.close(conn);

		return result1*result2;
	}
	
	
	public int listCount(int userNo) {
		Connection conn = getConnection();

		int result = new BoardDao().listCount(conn, userNo);

		close(conn);

		return result;
	}
	
	public ArrayList<Board> userWriting(PageInfo pi, int userNo) {
		Connection conn = getConnection();

		ArrayList<Board> boardList = new BoardDao().userWriting(conn, pi, userNo);

		close(conn);

		return boardList;
	}
	
	public int listCountReply(int userNo) {
		Connection conn = getConnection();

		int result = new BoardDao().listCountReply(conn, userNo);

		close(conn);

		return result;
	}
	
	public ArrayList<Board> userComments(PageInfo pi, int userNo) {
		Connection conn = getConnection();

		ArrayList<Board> boardList = new BoardDao().userComments(conn, pi, userNo);

		close(conn);

		return boardList;
	}
	
	public int listCountScrap(int userNo) {
		Connection conn = getConnection();

		int result = new BoardDao().listCountScrap(conn, userNo);

		close(conn);

		return result;
	}
	
	public ArrayList<Board> userScrap(PageInfo pi, int userNo) {
		Connection conn = getConnection();

		ArrayList<Board> boardList = new BoardDao().userScrap(conn, pi, userNo);

		close(conn);

		return boardList;
	}
	

}
