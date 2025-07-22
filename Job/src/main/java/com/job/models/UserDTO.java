package com.job.models;

import java.util.List;

public class UserDTO {
	private Long id;
    private String userName;
    private String email;
    private List<Long> myJobIds;
    private List<Long> myFavoriteJobIds;
    private String password;
    private String confirm;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<Long> getMyJobIds() {
		return myJobIds;
	}
	public void setMyJobIds(List<Long> myJobIds) {
		this.myJobIds = myJobIds;
	}
	public List<Long> getMyFavoriteJobIds() {
		return myFavoriteJobIds;
	}
	public void setMyFavoriteJobIds(List<Long> myFavoriteJobIds) {
		this.myFavoriteJobIds = myFavoriteJobIds;
	}
    
    
}
