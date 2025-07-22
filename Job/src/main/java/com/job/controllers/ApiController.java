package com.job.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.job.models.Job;
import com.job.models.User;
import com.job.services.JobService;
import com.job.services.UserService;

@RestController
@RequestMapping("/api")
public class ApiController {
	
	@Autowired
	JobService jobservice;
	@Autowired 
	UserService userService;
	
	//get all jobs 
	@GetMapping("/jobs")
    public ResponseEntity<List<Job>> apiGetAllJobs(){
		// we will get the data using jobService
		List<Job> listOfJobs=jobservice.getAllJobs();
		//return the response 
		return new  ResponseEntity<>(listOfJobs,HttpStatus.OK);
	}
	
	//get all users 
		@GetMapping("/users")
	    public ResponseEntity<List<User>> apiGetAllUsers(){
			// we will get the data using jobService
			List<User> listOfUser=userService.getAllUsers();
			//return the response 
			return new  ResponseEntity<>(listOfUser,HttpStatus.OK);
		}
		
		//get all jobs 
		@GetMapping("/jobs/top")
	    public ResponseEntity<List<Job>> apiGetTop3Jobs(){
			// we will get the data using jobService
			List<Job> listOfJobs=jobservice.getTop3jobs();
			//return the response 
			return new  ResponseEntity<>(listOfJobs,HttpStatus.OK);
		}
		
		// find user by id 
		@GetMapping("/user/{id}")
		public ResponseEntity apiGetUserById(@PathVariable("id")Long id) {
			User currentUser = userService.getUserById(id);
			// if user does not exist 
			if(currentUser==null) {
				return ResponseEntity
						          .status(HttpStatus.NOT_FOUND)
						          .body("the user with the id : "+id+" does not exists !");
			}
		return 	ResponseEntity
	          .status(HttpStatus.OK)
	          .body(currentUser);
		}
		
		@PostMapping("/user/create")
		public ResponseEntity<User> apiCreateUser(@RequestBody User user,BindingResult result){
			return new ResponseEntity<>(userService.register(user, result),HttpStatus.CREATED);
		}
		
		@PostMapping(value="/jobs/create",consumes = "application/json", produces = "application/json")
		public ResponseEntity<Job> apiCreateJob(@RequestBody Job job){
			return new ResponseEntity<>(jobservice.createJob(job),HttpStatus.CREATED);
		}
		
		/*
		 * @PostMapping("/user/create")
		public ResponseEntity<User> apiCreateUser(@RequestParam("userName")String userName,
				@RequestParam("email")String email,
				@RequestParam("confirm")String confirm,
				@RequestParam("password")String password,@ModelAttribute("user") User user, BindingResult result){
			   
			    // user.setConfirm(confirm);
			     user.setPassword(password);
			     user.setEmail(email);
			     user.setUserName(userName);
			
			System.out.println("tessttttt");
			return new ResponseEntity<>(userService.register(user, result),HttpStatus.CREATED);
		}*/
}
