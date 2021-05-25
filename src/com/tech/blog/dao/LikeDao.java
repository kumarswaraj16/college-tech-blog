package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean flag = false;
		String query = "insert into likes(pid,uid) values(?,?)";
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			stmt.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	public int countLikeOnPost(int pid) {
		int count = 0;
		String query = "select count(*) from likes where pid=?";
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean flag = false;

		String query = "select * from likes where pid=? and uid=?";
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteLike(int pid, int uid) {
		boolean flag = false;
		String query = "delete from likes where pid=? and uid=?";
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			stmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
