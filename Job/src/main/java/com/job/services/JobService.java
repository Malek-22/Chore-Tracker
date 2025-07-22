package com.job.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.models.Job;
import com.job.models.User;
import com.job.repositories.JobRepository;

@Service
public class JobService {
@Autowired 
JobRepository jobRepo;
@Autowired
UserService userServ;
// get all jobs 
public List<Job> getAllJobs(){
	return jobRepo.findAll();
}

// create job 
public Job createJob(Job job) {
	return jobRepo.save(job);
}

//findOneById
public Job findById(Long id) {
	Optional<Job> j= jobRepo.findById(id);
	
	if(j.isPresent()) {
		return j.get();
	}
	return null;
}

// delete job 
public void deleteJob(Long id) {
	Job jobToDelete=findById(id);
	jobToDelete.setCreator(null);
	jobToDelete.setAddToTheirFavourite(null);
	
	jobRepo.deleteById(id);
	
}
////  edit job 
public Job updateJob(Job job,Long id,User creator) {
	job.setCreator(creator);
	job.setId(id);
	return jobRepo.save(job);
}

// search job 
public List<Job> searchByTitle(String query){
	return jobRepo.findByTitleContains(query);
}

// add to favorites
public void addToFavorites(Long userId,Long jobId) {
	// find user by id 
	User currentUser = userServ.getUserById(userId);
	//find job by id 
	Job job = findById(jobId);
	
	if(currentUser!=null && job!=null) {
		// this also  will work  :currentUser.getMyFavoritesJobs().add(job); userRepo.save(currentUser)
		job.getAddToTheirFavourite().add(currentUser);
		jobRepo.save(job);
	}
	
}

//Remove from favorite
public void removeFromFavorites(Long userId,Long jobId) {
	// find user by id 
	User currentUser = userServ.getUserById(userId);
	//find job by id 
	Job job = findById(jobId);
	
	if(currentUser!=null && job!=null) {
		
		job.getAddToTheirFavourite().remove(currentUser);
		jobRepo.save(job);
	}
	
}

// native query 
public List<Job> getTop3jobs(){
	return jobRepo.findBest3Jobs();
}

}
