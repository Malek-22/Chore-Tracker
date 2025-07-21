package com.choretracker.choretracker.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choretracker.choretracker.models.Job;
import com.choretracker.choretracker.models.User;
import com.choretracker.choretracker.service.JobService;
import com.choretracker.choretracker.service.UserService;


import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class JobController {

    @Autowired
    private JobService jobService;

    @Autowired
    private UserService userService;
    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }

        Long userId = (Long) session.getAttribute("userId");
        User user = userService.findById(userId);
        model.addAttribute("user", user);

        List<Job> allJobs = jobService.all();
        model.addAttribute("jobs", allJobs);

        List<Job> myJobs = user.getMyJobs();
        model.addAttribute("myJobs", myJobs);

        return "Home.jsp";
    }

    @GetMapping("/jobs/add")
    public String showAddJobForm(Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/home";
        }
        model.addAttribute("job", new Job());
        return "addJob.jsp";
    }

    @PostMapping("/jobs/add")
    public String addJob(@Valid @ModelAttribute("job") Job job,
                         BindingResult result,
                         HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/home";
        }

        if (result.hasErrors()) {
            return "addJob.jsp";
        }

        User user = userService.findById((Long) session.getAttribute("userId"));
        job.setUser(user);
        jobService.create(job);

        return "redirect:/home";
    }

    @GetMapping("/jobs/{id}")
    public String viewJob(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }

        Job job = jobService.findById(id);
        if (job == null) {
            return "redirect:/home";
        }

        model.addAttribute("job", job);
        return "viewJob.jsp";
    }



@GetMapping("/jobs/addToMyList/{id}")
public String addToMyList(@PathVariable("id") Long id, HttpSession session, RedirectAttributes redirectAttributes) {
    Long userId = (Long) session.getAttribute("userId");
    if (userId == null) {
        return "redirect:/";
    }

    try {
        User user = userService.findById(userId);
        Job job = jobService.findById(id);

        if (user == null || job == null) {
            redirectAttributes.addFlashAttribute("error", "Invalid job or user");
            return "redirect:/home";
        }


        System.out.println("add my job"+user.getMyJobs());

        if (!user.getMyJobs().contains(job)) {
            userService.addJobToUser(user, job);
            redirectAttributes.addFlashAttribute("success", "Job added to your list!");
        } else {
            redirectAttributes.addFlashAttribute("info", "Job is already in your list");
        }

    } catch (Exception e) {
        redirectAttributes.addFlashAttribute("error", "Failed to add job: " + e.getMessage());
    }

    return "redirect:/home";
}

    @GetMapping("/jobs/done/{id}")
    public String markJobDone(@PathVariable("id") Long id, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/";

        User user = userService.findById(userId);
        Job job = jobService.findById(id);

        if (job != null && user != null) {
            userService.removeJobFromUser(user, job);
        }

        return "redirect:/home";
    }


    @GetMapping("/edit/{id}")
    public String showEditJobForm(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }

        Job job = jobService.findById(id);
        if (job == null) {
            return "redirect:/home";
        }

        model.addAttribute("job", job);
        return "editJob.jsp";
    }


    @GetMapping("/jobs/removeFromMyList/{id}")
    public String removeFromMyList(@PathVariable("id") Long id, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/";

        User user = userService.findById(userId);
        Job job = jobService.findById(id);

        if (job != null && user != null) {
            user.getMyJobs().remove(job);
            userService.save(user);
        }

        return "redirect:/home";
    }



    @PostMapping("/edit/{id}")
    public String editJob(@PathVariable("id") Long id,
                          @Valid @ModelAttribute("job") Job updatedJob,
                          BindingResult result,
                          HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }

        if (result.hasErrors()) {
            return "editJob.jsp";
        }

        Job job = jobService.findById(id);
        if (job == null) {
            return "redirect:/home";
        }

        job.setTitle(updatedJob.getTitle());
        job.setDescription(updatedJob.getDescription());
        job.setLocation(updatedJob.getLocation());
        jobService.update(job);

        return "redirect:/home";
    }

    @RequestMapping(value="/delete/{id}")
    public String destroy(@PathVariable("id") Long id, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
    
        Job job = jobService.findById(id);
        if (job == null) {
            return "redirect:/home";
        }
    
        Long userId = (Long) session.getAttribute("userId");
        if (!job.getUser().getId().equals(userId)) {
            return "redirect:/home";
        }
    
        jobService.delete(id);
        return "redirect:/home";
    }
}