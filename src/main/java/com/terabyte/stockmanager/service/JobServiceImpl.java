package com.terabyte.stockmanager.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;

@Service
public class JobServiceImpl implements JobService{

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private ClientService clientservice;
	
	public void create(Job job, Integer client){
		
		sessionFactory.getCurrentSession().save(job);
		job.setClient(clientservice.getClientById(client));			
	}

	
}
