package com.khtime.board.model.service;
import static com.khtime.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.khtime.board.model.dao.BoardDao;
import com.khtime.board.model.vo.Board;
public class BoardService {
	public ArrayList<Board> getHotBestBoardlist(int recommendCount) {
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().getHotBestBoardlist(conn, recommendCount);
		close(conn);
		return list;
	}
}
