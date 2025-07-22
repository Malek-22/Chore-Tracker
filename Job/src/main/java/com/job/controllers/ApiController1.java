package com.job.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.job.models.Job;
import com.job.models.JobDTO;
import com.job.models.User;
import com.job.models.UserDTO;
import com.job.services.JobService;
import com.job.services.UserService;
import com.job.utils.DTOConvertor;

@RestController
@RequestMapping("/api1")
public class ApiController1 {
	@Autowired
    JobService jobService;
    @Autowired
    UserService userService;
    
 

    @GetMapping("/jobs")
    public ResponseEntity<List<JobDTO>> apiGetAllJobs() {
        List<JobDTO> listOfJobDTOs = jobService.getAllJobs().stream()
                .map(DTOConvertor::convertToJobDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(listOfJobDTOs, HttpStatus.OK);
    }

    @GetMapping("/users")
    public ResponseEntity<List<UserDTO>> apiGetAllUsers() {
        List<UserDTO> listOfUserDTOs = userService.getAllUsers().stream()
                .map(DTOConvertor::convertToUserDTO)
                .collect(Collectors.toList());
        return new ResponseEntity<>(listOfUserDTOs, HttpStatus.OK);
    }

    @PostMapping(value = "/jobs/create", consumes = "application/json", produces = "application/json")
    public ResponseEntity<JobDTO> apiCreateJob(@RequestBody JobDTO jobDTO) {
        Job job = DTOConvertor.convertToJobEntity(jobDTO);
        Job createdJob = jobService.createJob(job);
        JobDTO createdJobDTO = DTOConvertor.convertToJobDTO(createdJob);
        return new ResponseEntity<>(createdJobDTO, HttpStatus.CREATED);
    }

    @PostMapping(value = "/user/create", consumes = "application/json", produces = "application/json")
    public ResponseEntity<UserDTO> apiCreateUser(@RequestBody UserDTO userDTO, BindingResult result) {
        User user = DTOConvertor.convertToUserEntity(userDTO);
        User createdUser = userService.register(user, result);
        UserDTO createdUserDTO = DTOConvertor.convertToUserDTO(createdUser);
        return new ResponseEntity<>(createdUserDTO, HttpStatus.CREATED);
    }
    }
