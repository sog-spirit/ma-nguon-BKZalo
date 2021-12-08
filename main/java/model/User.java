package model;

public class User {
	private String username;
	private String useralias;
	
	public User() {}
	public User(String username, String useralias) {
		this.username = username;
		this.useralias = useralias;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseralias() {
		return useralias;
	}
	public void setUseralias(String useralias) {
		this.useralias = useralias;
	}
}
