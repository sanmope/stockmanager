package com.terabyte.stockmanager.service;

import java.util.List;

import com.terabyte.stockmanager.model.Client;
import com.terabyte.stockmanager.model.Job;


public interface JobService {

	void create(Job job);
	public List<Job> listJobs();
}
