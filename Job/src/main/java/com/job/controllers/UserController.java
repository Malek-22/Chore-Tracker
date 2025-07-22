package com.job.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.job.models.LoginUser;
import com.job.models.User;
import com.job.services.JobService;
import com.job.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	@Autowired
	UserService userServ;
	@Autowired 
	JobService jobServ;
	
	// get index page (authentication)
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser",new User());
		model.addAttribute("newLogin",new LoginUser());
		return "index";
	}
	// registration process 
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
			             BindingResult result,
			             HttpSession session,
			             Model model) {
	User user = userServ.register(newUser, result);
		
	    if(result.hasErrors()) {
	        //  send in the empty LoginUser before re-rendering the page.
	        model.addAttribute("newLogin", new LoginUser());
	        return "index";
	    }
	    
	    session.setAttribute("userId", user.getId());
	    session.setAttribute("connectedUser", user);
	    return "redirect:/home";
		
	}

	// login process
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin")LoginUser newLogin,
			 BindingResult result,
	         HttpSession session,
	         Model model) {
		User user = userServ.login(newLogin, result);
		 
	    if(result.hasErrors() || user==null) {
	    	//set the new user to empty and redirect to index
	        model.addAttribute("newUser", new User());
	        return "index";
	    }
	     //redirect to home page
	    session.setAttribute("userId", user.getId());
	    session.setAttribute("connectedUser", user);
	 
	    return "redirect:/home";
	}

	// get home Page 
	@GetMapping("/home")
	public String getHome(HttpSession session,
			Model model) {
		//Route Garding to be added in each getMapping
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/logout";
		}
		User connectedUser = userServ.getUserById((Long) session.getAttribute("userId"));
		model.addAttribute("user", connectedUser);
		model.addAttribute("jobs",jobServ.getAllJobs());
		
		return "home";
	}
	
	
	// logOut
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
			session.invalidate();
		     
		    return "redirect:/";
	}


}
