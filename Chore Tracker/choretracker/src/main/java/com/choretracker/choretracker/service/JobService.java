package com.choretracker.choretracker.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choretracker.choretracker.models.Job;
import com.choretracker.choretracker.repositories.JobRepository;



@Service
public class JobService {
    
    @Autowired
    private JobRepository repository;

    public Job findById(Long id){
        Optional<Job> result = repository.findById(id);
        if(result.isPresent()){
            return result.get();
        }
        return null;
    }

    public Job create(Job job){
        return repository.save(job);
    }

    public JobService(JobRepository repository) {
        this.repository = repository;
    }

    public List<Job> all(){
        return repository.findAll();
    }

    public Job update(Job Job) {
        return repository.save(Job);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
    
    public List<Job> getAllCelebrities() {
        return repository.findAll();
    }
}