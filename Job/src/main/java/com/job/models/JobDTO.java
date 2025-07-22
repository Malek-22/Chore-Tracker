package com.job.models;

public class JobDTO {
	private Long id;
    private String title;
    private String description;
    private int rating;
    private UserDTO creator;
    
	public UserDTO getCreator() {
		return creator;
	}
	public void setCreator(UserDTO creator) {
		this.creator = creator;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
    
    
}
