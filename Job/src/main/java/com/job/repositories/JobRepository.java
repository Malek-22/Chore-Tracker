package com.job.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.job.models.Job;

@Repository
public interface JobRepository extends CrudRepository<Job,Long> {

	//find all jobs 
	List<Job> findAll();
	// find by title
	List<Job> findByTitleContains(String query);
	//get top 3 rated jobs 
	@Query(value="SELECT * FROM jobs ORDER BY rating DESC LIMIT 3",nativeQuery=true)
	List<Job> findBest3Jobs();
}
