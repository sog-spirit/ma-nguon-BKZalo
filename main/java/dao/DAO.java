package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DatabaseContext;
import model.MessageModel;
import model.User;

public class DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public User isAccountExist(String username, String password) {
		String query = "SELECT username, useralias FROM tableaccount WHERE username='" + username + "' AND password='" + password + "'";
		try {
			conn = DatabaseContext.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return new User(rs.getString(1), rs.getString(2));
			}
		}
		catch(Exception e) {
			
		}
		return null;
	}
	public List<User> getUserList(String username) {
		String query = "SELECT username, useralias FROM tableaccount WHERE NOT(username='"+username+"')";
		List<User> list = new ArrayList<>();
		try {
			conn = DatabaseContext.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				list.add(new User(rs.getString(1), rs.getString(2)));
			}
		}
		catch(Exception e) {
			
		}
		return list;
	}
	
	public List<MessageModel> getMessage(String sender, String receiver) {
		String query = "SELECT Sender, Receiver, MessageContent FROM message WHERE (Sender='"+sender+"' AND Receiver='"+receiver+"') OR (Sender='"+receiver+"' AND Receiver='"+sender+"') ORDER BY MessageID ASC";
		List<MessageModel> list = new ArrayList<>();
		
		try {
			conn = DatabaseContext.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new MessageModel(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
		}
		catch(Exception e) {
			
		}
		return list;
	}
	
	public void sendMessage(String sender, String receiver, String content) {
		String query = "INSERT INTO `message` (`MessageID`, `Sender`, `Receiver`, `MessageContent`) VALUES (NULL, '"+sender+"', '"+receiver+"', '"+content+"')";
		
		try {
			conn = DatabaseContext.getConnection();
			ps = conn.prepareStatement(query);
			ps.execute();
		}
		catch(Exception e) {
			
		}
	}
}
