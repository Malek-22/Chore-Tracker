package com.job.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.job.models.Job;
import com.job.models.User;
import com.job.services.JobService;
import com.job.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class JobController {
@Autowired
JobService jobServ;
@Autowired 
UserService userServ;


// get create page 
@GetMapping("/create")
public String createPage(@ModelAttribute("job")Job job,
		   HttpSession session) {
	Long userId = (Long) session.getAttribute("userId");
	if(userId == null) {
		return "redirect:/logout";
	}
	return "create";
}


//Post create job
@PostMapping("/create")
public String createJob(@Valid @ModelAttribute("job")Job job,BindingResult result,
		HttpSession session ) {
	
	if(result.hasErrors()) {
		return "create";
	}
	User currentUser = userServ.getUserById((Long) session.getAttribute("userId"));
	// we wil lset the creator 
	job.setCreator(currentUser);
	jobServ.createJob(job);
	return "redirect:/home";
}

// serach 
@GetMapping("/jobs/search")
public String searchJobs(@RequestParam("query")String query,Model model) {
	//new list of jobs after search 
	List<Job> jobs=jobServ.searchByTitle(query);
	model.addAttribute("jobs",jobs);
	return "home";
}

// get display page 
@GetMapping("/display/{jobId}")
public String displayPage(@PathVariable("jobId")Long jobId,
		                   Model model,
		                   HttpSession session) {
	Long userId = (Long) session.getAttribute("userId");
	//route garding
	if(userId == null) {
		return "redirect:/logout";
	}
	User connectedUser = userServ.getUserById(userId);
	 // set the job getted by id to the model 
	model.addAttribute("job",jobServ.findById(jobId));
	model.addAttribute("user",connectedUser);
	
	return "display";
	
	
	
}

//add to favorite
@GetMapping("/add/{jobId}")
public String addToFavorite(@PathVariable("jobId")Long jobId,
		                    HttpSession session) {
	Long userId = (Long) session.getAttribute("userId");
	//route garding
	if(userId == null) {
		return "redirect:/logout";
	}
	
	jobServ.addToFavorites(userId, jobId);
	return "redirect:/display/"+jobId;
	
	
}

// remove from favorite
@GetMapping("/remove/{jobId}")
public String removeFromFavorite(@PathVariable("jobId")Long jobId,
		                    HttpSession session) {
	Long userId = (Long) session.getAttribute("userId");
	//route garding
	if(userId == null) {
		return "redirect:/logout";
	}
	
	jobServ.removeFromFavorites(userId, jobId);
	return "redirect:/display/"+jobId;
	
	
}

// get edit page
@GetMapping("/edit/{jobId}")
public String getEditPage(@PathVariable("jobId")Long jobId,
		                  Model model,
		                    HttpSession session) {
	Long userId = (Long) session.getAttribute("userId");
	Job job=jobServ.findById(jobId);
	//route garding
	if(userId == null || !job.getCreator().getId().equals(userId) ) {
		return "redirect:/logout";
	}
	model.addAttribute("job",job);
	return "edit";
}

//Put mapping
@PutMapping("/edit/{jobId}")
public String editJob(@Valid @ModelAttribute("job")Job job,BindingResult result,
		              HttpSession session,
		               @PathVariable("jobId")Long jobId,
		               Model model) {
	
	Long userId = (Long) session.getAttribute("userId");
	//route garding
	if(userId == null) {
		return "redirect:/logout";
	}
	if(result.hasErrors()) {
		job.setId(jobId);
		model.addAttribute("job",job);
		return "edit";
	}
	
	User connectedUser = userServ.getUserById(userId);
	jobServ.updateJob(job, jobId, connectedUser);
	return "redirect:/home";
	
}
//delete job
@GetMapping("/delete/{jobId}")
public String delete(@PathVariable("jobId")Long jobId) {
	
	jobServ.deleteJob(jobId);
	return "redirect:/home";
}
}
