package com.job.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.job.models.User;

@Repository
public interface UserRepository extends CrudRepository<User,Long> {
	//find all 
		List<User> findAll();
		// find by email 
		Optional<User> findByEmail(String email);
	
}
