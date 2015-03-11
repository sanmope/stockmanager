package com.terabyte.stockmanager.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;

@Service
public class JobServiceImpl implements JobService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	public void create(Job job){
		
		sessionFactory.getCurrentSession().save(job);		
	}

	public List<Job> listJobs(){
		
		
		List<Job> jobs = sessionFactory.getCurrentSession().createQuery("from Job").list();
		return jobs;
	}
	
}
