package com.choretracker.choretracker.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.choretracker.choretracker.models.Job;
import com.choretracker.choretracker.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    List<User> findAll();
    List<User> findByMyJobsContains(Job job);

    Optional<User> findByEmail(String email);
}