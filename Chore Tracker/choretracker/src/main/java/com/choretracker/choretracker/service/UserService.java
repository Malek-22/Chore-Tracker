package com.choretracker.choretracker.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.choretracker.choretracker.models.Job;
import com.choretracker.choretracker.models.LoginUser;
import com.choretracker.choretracker.models.User;
import com.choretracker.choretracker.repositories.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository repository;

    @Autowired
    private UserRepository userRepository;

    public User register(User newUser, BindingResult result) {
        Optional<User> userLookUp = userRepository.findByEmail(newUser.getEmail());
        if (userLookUp.isPresent()) {
            result.rejectValue("email", "Unique", "Account with this email already exists.");
        }
        if (!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        if (result.hasErrors()) {
            return null;
        }
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        newUser = repository.save(newUser);
        System.out.println("New user created with ID and EMAIL : " + newUser.getId() + newUser.getEmail());
        return newUser;
    }

    public User login(LoginUser newLogin, BindingResult result) {
        Optional<User> userLookUp = userRepository.findByEmail(newLogin.getEmail());
        if (!userLookUp.isPresent()) {
            result.rejectValue("email", "MissingAccount", "No account found.");
            return null;
        }
        User user = userLookUp.get();
        if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Matches", "Invalid Password!");
        }
        if (result.hasErrors()) {
            return null;
        }
        return user;
    }


    public User findByEmail(String email) {

        Optional<User> result = repository.findByEmail(email);
        if (result.isPresent()) {
            return result.get();
        }

        return null;
    }

    public User findById(Long id) {

        Optional<User> result = repository.findById(id);
        if (result.isPresent()) {
            return result.get();
        }

        return null;
    }


    @Transactional
    public void addJobToUser(User user, Job job) {
        System.out.println("from service" + user.getMyJobs());
        ArrayList<Job> myJobs = new ArrayList<>(user.getMyJobs());
        myJobs.add(job);
        ArrayList<Job> newList = myJobs;
            user.setMyJobs(newList);
        System.out.println("from service after add" + user.getMyJobs());
            userRepository.save(user);
    }



    @Transactional
    public void removeJobFromUser(User user, Job job) {
        if (user.getMyJobs().contains(job)) {
            user.getMyJobs().remove(job);
            userRepository.save(user);
        }
    }
    
    public List<User> findUsersByJob(Job job) {
        return repository.findByMyJobsContains(job);
    }

    public void save(User user) {
        userRepository.save(user);
    }    
    
}