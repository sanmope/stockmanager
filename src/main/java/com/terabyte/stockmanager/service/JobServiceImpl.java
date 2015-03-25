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
	
	@Transactional
	public void delete(Job job){
		
		sessionFactory.getCurrentSession().delete(job);		
	}
	
	@Transactional
	public void update(Job job){
		
		sessionFactory.getCurrentSession().update(job);		
	}

	public List<Job> listJobs(){
		
		
		List<Job> jobs = sessionFactory.getCurrentSession().createQuery("from Job").list();
		return jobs;
	}
	
	public List<Job> listJobsByClient(Client client){
		
		
		List<Job> jobs = sessionFactory.getCurrentSession().createQuery("FROM Job where client_id =" + client.getId() ).list();
		return jobs;
	}
	
	public Job getJobById(Integer jobId){
		
		return (Job) sessionFactory.getCurrentSession().get(Job.class,jobId);
	}
	
}
