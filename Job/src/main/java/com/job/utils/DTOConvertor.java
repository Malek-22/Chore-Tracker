package com.job.utils;

import java.util.ArrayList;
import java.util.stream.Collectors;

import com.job.models.Job;
import com.job.models.JobDTO;
import com.job.models.User;
import com.job.models.UserDTO;

public class DTOConvertor {

	 public static JobDTO convertToJobDTO(Job job) {
	        JobDTO jobDTO = new JobDTO();
	        jobDTO.setId(job.getId());
	        jobDTO.setTitle(job.getTitle());
	        jobDTO.setDescription(job.getDescription());
	        jobDTO.setRating(job.getRating());
if(convertToUserDTO(job.getCreator())!=null) {
	  jobDTO.setCreator(convertToUserDTO(job.getCreator()));
}
	      
	        return jobDTO;
	    }

	 public static UserDTO convertToUserDTO(User user) {
		    UserDTO userDTO = new UserDTO();
		    userDTO.setId(user.getId());
		    userDTO.setUserName(user.getUserName());
		    userDTO.setEmail(user.getEmail());
		    userDTO.setMyJobIds(user.getMyJobs() != null ? user.getMyJobs().stream().map(Job::getId).collect(Collectors.toList()) : new ArrayList<>());
		    userDTO.setMyFavoriteJobIds(user.getMyFavoritesJobs() != null ? user.getMyFavoritesJobs().stream().map(Job::getId).collect(Collectors.toList()) : new ArrayList<>());
		    return userDTO;
		}

    public static Job convertToJobEntity(JobDTO jobDTO) {
        Job job = new Job();
        job.setId(jobDTO.getId());
        job.setTitle(jobDTO.getTitle());
        job.setDescription(jobDTO.getDescription());
        job.setRating(jobDTO.getRating());
        
        User creator = new User();
       
        creator.setId(jobDTO.getCreator().getId());
        creator.setUserName(jobDTO.getCreator().getUserName());
        creator.setEmail(jobDTO.getCreator().getEmail());
        job.setCreator(creator);
        
        return job;
    }

    public static User convertToUserEntity(UserDTO userDTO) {
    	User user = new User();
        user.setId(userDTO.getId());
        user.setUserName(userDTO.getUserName());
        user.setEmail(userDTO.getEmail());
        user.setPassword(userDTO.getPassword());
        user.setConfirm(userDTO.getConfirm());
        // Set other fields as needed
        return user;
    }}