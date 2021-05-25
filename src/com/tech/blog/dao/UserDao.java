package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tech.blog.entities.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean flag = false;
		try {
			String query = "insert into users(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getGender());
			stmt.setString(5, user.getAbout());
			stmt.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {
			String query = "select * from users where email=? and password=?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(User user) {
		boolean flag = false;
		String query = "update users set name=? , email=? , password=? , about=? , profile=? where id=?";
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getAbout());
			stmt.setString(5, user.getProfile());
			stmt.setInt(6, user.getId());
			stmt.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public User getUserByUserId(int userId) {
		User user = null;

		String query = "select * from users where id=?";

		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

}
