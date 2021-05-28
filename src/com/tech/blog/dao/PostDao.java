package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {
			String query = "select * from categories";
			PreparedStatement stmt = this.con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int cid = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				Category category = new Category(cid, name, description);
				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post p) {
		boolean flag = false;

		try {
			String query = "insert into posts(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, p.getpTitle());
			stmt.setString(2, p.getpContent());
			stmt.setString(3, p.getpCode());
			stmt.setString(4, p.getpPic());
			stmt.setInt(5, p.getCatId());
			stmt.setInt(6, p.getUserId());
			stmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public ArrayList<Post> getAllPosts() {
		ArrayList<Post> list = new ArrayList<Post>();
		String query = "select * from posts order by pid desc";
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int pId = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pPic = rs.getString("ppic");
				Timestamp pDate = rs.getTimestamp("pdate");
				int catId = rs.getInt("catid");
				int userId = rs.getInt("userid");

				Post post = new Post(pId, pTitle, pContent, pCode, pPic, catId, pDate, userId);
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<Post> getAllPostsByCatId(int catId) {
		ArrayList<Post> list = new ArrayList<Post>();
		String query = "select * from posts where catid=? order by pid desc";
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, catId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int pId = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pPic = rs.getString("ppic");
				Timestamp pDate = rs.getTimestamp("pdate");
				int userId = rs.getInt("userid");

				Post post = new Post(pId, pTitle, pContent, pCode, pPic, catId, pDate, userId);
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public Post getPostByPostId(int pid) {
		Post post = null;

		String query = "select * from posts where pid=?";

		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pPic = rs.getString("ppic");
				int catId = rs.getInt("catid");
				int userId = rs.getInt("userid");
				Timestamp pDate = rs.getTimestamp("pdate");

				post = new Post(pid, pTitle, pContent, pCode, pPic, catId, pDate, userId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return post;
	}

	public ArrayList<Post> getRecentPost() {
		ArrayList<Post> recentPosts = null;

		String query = "select pid from likes group by pid order by count(*) desc limit 6";
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			recentPosts = new ArrayList<>();
			while (rs.next()) {
				int pid = rs.getInt(1);
				Post post = getPostByPostId(pid);
				recentPosts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return recentPosts;
	}

	public ArrayList<Post> getAllPostByUserId(int userId) {
		ArrayList<Post> userPosts = new ArrayList<>();

		String query = "select * from posts where userid=? order by pdate desc";

		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int postId = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pPic = rs.getString("ppic");
				int catId = rs.getInt("catid");
				Timestamp pDate = rs.getTimestamp("pdate");
				Post post = new Post(postId, pTitle, pContent, pCode, pPic, catId, pDate, userId);
				userPosts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userPosts;
	}

	public ArrayList<Post> getUserPostsByCatId(int userId, int catId) {
		ArrayList<Post> userPostsByCatId = new ArrayList<>();

		String query = "select * from posts where userid=? and catid=? order by pdate desc";

		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, userId);
			stmt.setInt(2, catId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int postId = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pcode");
				String pPic = rs.getString("ppic");
				Timestamp pDate = rs.getTimestamp("pdate");
				Post post = new Post(postId, pTitle, pContent, pCode, pPic, catId, pDate, userId);
				userPostsByCatId.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userPostsByCatId;
	}

	public boolean deletePost(int pid) {
		boolean flag = false;

		String query = "delete from posts where pid=?";

		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setInt(1, pid);
			stmt.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	public ArrayList<Post> searchedPosts(String value) {
		ArrayList<Post> list = new ArrayList<>();
		String query = ("select * from posts where ptitle ilike '%" + value + "%'");
		try {
			PreparedStatement stmt = this.con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int postId = rs.getInt("pid");
				Post post = getPostByPostId(postId);
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
