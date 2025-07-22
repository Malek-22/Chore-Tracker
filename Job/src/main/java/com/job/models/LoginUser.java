package com.job.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class LoginUser {

	
	 @NotNull
	    @Email
		private String email;
		
		@Size(min=3)
		private String password;
		
		//empty constructor
		public LoginUser() {}
		//getters & setters 
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
}
